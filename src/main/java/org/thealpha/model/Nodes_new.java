package org.thealpha.model;

public class Nodes_new {
	private String name;
	private int symbolSize;
	private String category;
	private String draggable;

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setSymbolSize(int symbolSize) {
		this.symbolSize = symbolSize;
	}
	public int getSymbolSize(){
		return symbolSize;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCategory(){
		return category;
	}
	public void setDraggable(String draggable) {
		this.draggable = draggable;
	}
	public String getDraggable(){
		return draggable;
	}

}
