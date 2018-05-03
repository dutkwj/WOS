package org.thealpha.model;

import java.util.List;

public class TeacherWarp {
	private String name;
	private List<Teacher> children;

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setChildren(List<Teacher> children) {
		this.children = children;
	}

	public List<Teacher> getChildren() {
		return children;
	}

}
