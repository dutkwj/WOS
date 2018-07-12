package org.thealpha.model;

import java.io.Serializable;

/**
 * Created by kangwenjie on 18-4-11.
 */
public class Node implements Serializable{
    private String id;
    private String name;
    private String size;
    private String color;

    private double qindex;
    private double hindex;
    private String aff;
    private String studyField;


    public double getQindex() {
        return qindex;
    }

    public void setQindex(double qindex) {
        this.qindex = qindex;
    }

    public double getHindex() {
        return hindex;
    }

    public void setHindex(double hindex) {
        this.hindex = hindex;
    }

    public String getAff() {
        return aff;
    }

    public void setAff(String aff) {
        this.aff = aff;
    }

    public String getStudyField() {
        return studyField;
    }

    public void setStudyField(String studyField) {
        this.studyField = studyField;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
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

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    private String value;
    private int category;
}
