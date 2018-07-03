package org.thealpha.model;

import java.util.List;

public class Teacher_3 {
	private String name;
	private List<Teacher_2> children;

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setChildren(List<Teacher_2> children) {
		this.children = children;
	}

	public List<Teacher_2> getChildren() {
		return children;
	}

}
