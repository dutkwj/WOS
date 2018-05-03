package org.thealpha.model;

import java.util.List;

public class Teacher {
	private String name;
	private List<Student> children;

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setChildren(List<Student> children) {
		this.children = children;
	}

	public List<Student> getChildren() {
		return children;
	}

}
