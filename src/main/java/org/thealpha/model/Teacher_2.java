package org.thealpha.model;

import java.util.List;

public class Teacher_2 {
	private String name;
	private List<Teacher_1> children;

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setChildren(List<Teacher_1> children) {
		this.children = children;
	}

	public List<Teacher_1> getChildren() {
		return children;
	}

}
