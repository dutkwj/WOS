package org.thealpha.model;

import java.io.Serializable;
import java.util.List;

/**
 * Created by kangwenjie on 17-12-15.
 */
public class Cooperater implements Serializable{
    private String index;
    private String name;
    private double hindex;
    private double qindex;
    private String aff;
    private int count;
    private String latlng;
    private String latitude;
    private String longitude;
    private String fieldName;
    private int cooperateNumber;
    private int coTeamNumber;
    private int studentsNumber;
    private String cooperate;
    public String getCooperate(){
        return cooperate;
    }
    public void setCooperate(String cooperate){
        this.cooperate=cooperate;
    }


    private List<Cooperater> subCooperaters;
//    合作强度
    private double intensity;
//    合作年份
    private String year;

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public double getIntensity() {
        return intensity;
    }

    public void setIntensity(double intensity) {
        this.intensity = intensity;
    }

    public List<Cooperater> getSubCooperaters() {
        return subCooperaters;
    }

    public void setSubCooperaters(List<Cooperater> subCooperaters) {
        this.subCooperaters = subCooperaters;
    }

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

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    private double intension;

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

    public double getIntension() {
        return intension;
    }

    public void setIntension(double intension) {
        this.intension = intension;
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

    public String getAff() {
        return aff;
    }

    public void setAff(String aff) {
        this.aff = aff;
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

    public int getCount() {
        return count;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Cooperater)) return false;

        Cooperater that = (Cooperater) o;

        return index.equals(that.index);
    }

    @Override
    public int hashCode() {
        return index.hashCode();
    }

    public void setCount(int count) {
        this.count = count;
    }
}
