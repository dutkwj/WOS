package org.thealpha.model;

import java.io.Serializable;

/**
 * Created by kangwenjie on 17-12-15.
 */
public class Scholar implements Serializable{
    private String index;
    private String name;
    private String aff;
    private int count;
    private String latlng;
    private String latitude;
    private String longitude;
    private double hindex;
    private double qindex;
    private String fieldName;

    private int cooperateNumber;
    private int coTeamNumber;
    private int studentsNumber;
    private int refNumber;
    private int refedNumber;
    private int coRefNumber;
    private int coRefedNumber;

    public double getQindex() {
        return qindex;
    }

    public void setQindex(double qindex) {
        this.qindex = qindex;
    }

    public int getCooperateNumber() {
        return cooperateNumber;
    }

    public void setCooperateNumber(int cooperateNumber) {
        this.cooperateNumber = cooperateNumber;
    }

    public int getCoTeamNumber() {
        return coTeamNumber;
    }

    public void setCoTeamNumber(int coTeamNumber) {
        this.coTeamNumber = coTeamNumber;
    }

    public int getStudentsNumber() {
        return studentsNumber;
    }

    public void setStudentsNumber(int studentsNumber) {
        this.studentsNumber = studentsNumber;
    }

    public int getRefNumber() {
        return refNumber;
    }

    public void setRefNumber(int refNumber) {
        this.refNumber = refNumber;
    }

    public int getRefedNumber() {
        return refedNumber;
    }

    public void setRefedNumber(int refedNumber) {
        this.refedNumber = refedNumber;
    }

    public int getCoRefNumber() {
        return coRefNumber;
    }

    public void setCoRefNumber(int coRefNumber) {
        this.coRefNumber = coRefNumber;
    }

    public int getCoRefedNumber() {
        return coRefedNumber;
    }

    public void setCoRefedNumber(int coRefedNumber) {
        this.coRefedNumber = coRefedNumber;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public double getHindex() {
        return hindex;
    }

    public void setHindex(double hindex) {
        this.hindex = hindex;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatlng() {
        return latlng;
    }

    public void setLatlng(String latlng) {
        this.latlng = latlng;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getIndex() {
        return index;
    }

    public void setIndex(String index) {
        this.index = index;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAff() {
        return aff;
    }

    public void setAff(String aff) {
        this.aff = aff;
    }

}
