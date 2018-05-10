package org.thealpha.model;

import java.util.List;

public class Evalue {
	private String name;
	private double hindex;
	private int cocount;
	private int refednum;
	private int papernum;
	public void setName(String name){this.name=name;}
	public String getName(){return name;}
	public void setHindex(double hindex){this.hindex=hindex;}
	public double getHindex(){return hindex;}
	public void setCocount(int cocount){this.cocount=cocount;}
	public int getCocount(){return cocount;}
	public void setRefednum(int refednum){this.refednum=refednum;}
	public int getRefednum(){return refednum;}
	public void setPapernum(int papernum){this.papernum=papernum;}
	public int getPapernum(){return papernum;}

}
