package org.openxava.demoapp.model.testcase;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Parameter;
import org.hibernate.annotations.Type;
import org.openxava.actions.OnChangePropertyBaseAction;
import org.openxava.annotations.DefaultValueCalculator;
import org.openxava.annotations.ListProperties;
import org.openxava.annotations.OnChange;
import org.openxava.annotations.Required;
import org.openxava.calculators.CurrentDateCalculator;
import org.openxava.demoapp.etc._Link;
import org.openxava.ex.model.base.BaseBillModel;
import org.openxava.ex.model.base.BaseBillModelWithTrace;
import org.openxava.view.View;

/**
 * Test case for "Create order from Template" function
 */
@Entity
@Table(name="TEST_OrderWithTemplate")
public class OrderWithTemplateTestCase extends BaseBillModelWithTrace {
	
	@Required
	@DefaultValueCalculator(value=CurrentDateCalculator.class)
	private Date planDate;
	
	@Required
	@Type(type=_Link.EnumLetterType, parameters={
			@Parameter(name="letters", value=DataType.FIRST_LETTERS),
			@Parameter(name="enumType", value="org.openxava.demoapp.model.testcase.OrderWithTemplateTestCase$DataType")
	})
	@OnChange(DataTypeChangeAction.class)
	private DataType dataType;
	
	@OneToMany(mappedBy=BaseBillModel.RELATIONSHIP_FIELD_BILLHEAD, cascade=CascadeType.ALL)
	@OrderBy("planCompleteDate")
	@ListProperties("taskName, planType, planCompleteDate, planCompleteDays")
	private Collection<OrderWithTemplateTestCaseLine> details = new ArrayList<OrderWithTemplateTestCaseLine>();
	
	public static enum DataType {
		Order, Template;
		public static final String FIRST_LETTERS = "OT";
	}
	public Date getPlanDate() {
		return planDate;
	}
	public void setPlanDate(Date planDate) {
		this.planDate = planDate;
	}
	public DataType getDataType() {
		return dataType;
	}
	public void setDataType(DataType dataType) {
		this.dataType = dataType;
	}
	public Collection<OrderWithTemplateTestCaseLine> getDetails() {
		return details;
	}
	public void setDetails(Collection<OrderWithTemplateTestCaseLine> details) {
		this.details = details;
	}

	public static class DataTypeChangeAction extends OnChangePropertyBaseAction{
		public void execute() throws Exception {
			//BP: Set fields visible/editable/value dynamic when value change
			View v = this.getView();
			DataType dt = (DataType) v.getValue("dataType");
			if (DataType.Template.equals(dt)){
				v.setEditable("planDate", false);
				v.setValue("planDate", new Date(0));
			}else{
				v.setEditable("planDate", true);
			}
		}
	}
}
