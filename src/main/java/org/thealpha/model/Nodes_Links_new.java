package org.thealpha.model;

import java.util.List;

public class Nodes_Links_new {
	private List<Nodes_new> data;
	private List<Links_new> links;
	private List<Categories> categories;
	public void setData(List<Nodes_new> data) {
		this.data = data;
	}

	public List<Nodes_new> getData() {
		return data;
	}

	public void setLinks(List<Links_new> links) {
		this.links = links;
	}

	public List<Links_new> getLinks() {
		return links;
	}
	public void setCategories(List<Categories> categories) {
		this.categories = categories;
	}

	public List<Categories> getCategories() {
		return categories;
	}
}
