package org.openxava.school.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.openxava.annotations.Required;

/**
 * 
 * @author Javier Paniza
 */

@Entity
public class Teacher {
	
	@Id @Column(length=5) @Required   
	private String id;
	
	@Column(length=40) @Required
	private String name;
	
	@Column(length=20)
	private String code;
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
