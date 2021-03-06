package org.openxava.tab.impl;

import java.lang.reflect.Field;
import java.rmi.*;
import java.util.*;

import javax.persistence.*;

import org.apache.commons.lang3.reflect.FieldUtils;
import org.apache.commons.logging.*;
import org.openxava.jpa.*;
import org.openxava.mapping.*;
import org.openxava.model.meta.*;
import org.openxava.util.*;

/** 
 * An <code>ITabProvider</code> that obtain data via JPA. <p>
 *
 * @author  Javier Paniza
 */

public class JPATabProvider extends TabProviderBase {
	
	private static Log log = LogFactory.getLog(JPATabProvider.class);
	
	protected String translateCondition(String condition) {
		int i = 0;
		while (condition.contains("?")) {		
			condition = condition.replaceFirst("\\?", ":p" + (i++));
		}
		return changePropertiesByJPAProperties(condition); 
	}
	
	public String toQueryField(String propertyName) {		
		return "e." + propertyName;
	}

	public String getSelectBase() {
		return changePropertiesByJPAProperties(getSelectWithEntityAndJoins());
	}
	
	public Collection<TabConverter> getConverters() {	
		return null;
	}
	
	private String getSelectWithEntityAndJoins() {
		String select = getMetaTab().getSelect();		
		int i = select.indexOf("from ${");
		if (i < 0) return select; 
		int f = select.indexOf("}", i);
		StringBuffer entityAndJoins = new StringBuffer();
		entityAndJoins.append("from ");
		entityAndJoins.append(getMetaModel().getName());
		entityAndJoins.append(" e");
		
		if (hasReferences()) {
			// the tables
			
			Iterator itReferencesMappings = getEntityReferencesMappings().iterator();			
			while (itReferencesMappings.hasNext()) {
				ReferenceMapping referenceMapping = (ReferenceMapping) itReferencesMappings.next();				
				String reference = referenceMapping.getReference();				
				int idx = reference.lastIndexOf('_');				
				if (idx >= 0) {
					// In the case of reference to entity in aggregate only we will take the last reference name
					reference = reference.substring(idx + 1);
				}								 			
				//PATCH 20131009: Catch javax.persistence.EntityNotFoundException for referenced property
				//entityAndJoins.append(" left join e");
				String refJoin = " left join e";
				Class<?> mainPojo = referenceMapping.getContainer().getMetaModel().getPOJOClass();
				Field refField = FieldUtils.getField(mainPojo, reference, true);
				ManyToOne m2o = refField.getAnnotation(ManyToOne.class);
				if (null!=m2o && !m2o.optional()){	//If @ManyToOne.optional() is NOT optional, Force INNER JOIN
					refJoin = " inner join e";
				}
				entityAndJoins.append(refJoin);
				//PATCH 20131009: END
				String nestedReference = (String) getEntityReferencesReferenceNames().get(referenceMapping);
				if (!Is.emptyString(nestedReference)) {					
					entityAndJoins.append(isAggregate(nestedReference)?".":"_");
					entityAndJoins.append(nestedReference);
				}				
				entityAndJoins.append(".");
				entityAndJoins.append(reference);				
				entityAndJoins.append(" e_");
				if (!Is.emptyString(nestedReference)) {					
					entityAndJoins.append(nestedReference);
					entityAndJoins.append("_");
				}				
				entityAndJoins.append(reference);
			}
		}
		
		resetEntityReferencesMappings();
		
		StringBuffer result = new StringBuffer(select);
		result.replace(i, f + 2, entityAndJoins.toString());
		return result.toString();
	}	
	
	private boolean isAggregate(String reference) {
		try {
			MetaReference ref = getMetaModel().getMetaReference(reference);					
			return ref.isAggregate();
		}
		catch (ElementNotFoundException ex) {
			return false;
		}
	}

	private String changePropertiesByJPAProperties(String source) { 
		if (!source.contains("${")) return source;
		StringBuffer r = new StringBuffer(source);		
		int i = r.toString().indexOf("${");
		int f = 0;
		while (i >= 0) {
			f = r.toString().indexOf("}", i + 2);
			if (f < 0)
				break;
			String modelElement = r.substring(i + 2, f);
			String jpaElement = "e." + modelElement; // The more common case			
			if (getMetaModel().isCalculated(modelElement)) {
				jpaElement = "0";
			}
			else if (modelElement.contains(".")) {				
				String reference = modelElement.substring(0, modelElement.lastIndexOf('.'));
				if (!isAggregate(reference)) {
					if (!getMetaModel().getMetaProperty(modelElement).isKey()) {
						StringBuffer qualifiedElement = new StringBuffer(modelElement.replaceAll("\\.", "_"));
						int last = qualifiedElement.lastIndexOf("_");
						qualifiedElement.replace(last, last + 1, ".");
						jpaElement = "e_" + qualifiedElement;
					}
				}
			}						
			else if (Strings.isModelName(modelElement)) { 
				jpaElement = modelElement;
			}			
			r.replace(i, f + 1, jpaElement);
			i = r.toString().indexOf("${");
		}
		return r.toString();
	}
	
	public DataChunk nextChunk() throws RemoteException {		
		if (getSelect() == null || isEOF()) { // search not called yet
			return new DataChunk(Collections.EMPTY_LIST, true, getCurrent()); // Empty
		}		
		try { 
			List data = nextBlock();			
			setCurrent(getCurrent() + data.size());			
			setEOF(data.size() != getChunkSize());
			return new DataChunk(data, isEOF(), getCurrent());
		}
		catch (Exception ex) {
			log.error(XavaResources.getString("select_error", getSelect()), ex);
			throw new RemoteException(XavaResources.getString("select_error", getSelect()));
		}
	}
		
	private List<Object []> nextBlock() {		
		if (keyHasNulls()) return Collections.EMPTY_LIST; // Because some databases (like Informix) have problems setting nulls
				
		Query query = XPersistence.getManager().createQuery(getSelect()); 
		// Fill key values
		StringBuffer message =
			new StringBuffer("[JPATabProvider.nextBlock] ");
		message.append(XavaResources.getString("executing_select", getSelect()));		
		
		Object [] key = getKey(); 
		for (int i = 0; i < key.length; i++) {
			query.setParameter("p" + i, key[i]);
			/* EX: 01-Make parameters' display more clear //
			message.append(key[i]);
			if (i < key.length - 1)
				message.append(", ");
			*/
			if (i == 0){
				message.append(": ");
			}else{
				message.append(", ");
			}
			message.append(key[i]);
			/* EX: 01-END */
		}
		log.debug(message);
		
		query.setMaxResults(getChunkSize()); 
		query.setFirstResult(getCurrent());
		return query.getResultList();						
	}

	protected Number executeNumberSelect(String select, String errorId) {
		if (select == null || keyHasNulls()) return 0;						
		try {			
			Query query = XPersistence.getManager().createQuery(select);
			Object [] key = getKey();
			for (int i = 0; i < key.length; i++) {
				query.setParameter("p" + i, key[i]);				
			}			
			
			return (Number) query.getSingleResult();
		}
		catch (Exception ex) {
			log.error(ex.getMessage(), ex);
			throw new XavaException(errorId);
		}
	}

	public boolean usesConverters() {
		return false;
	}

	protected String translateProperty(String property) {
		return "e." + property;
	}

}
