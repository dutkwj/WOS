package org.thealpha.model;

/**
 * Created by kangwenjie on 17-12-15.
 */
public class Cooperater {
    private String index;
    private String name;
    private String aff;
    private int count;
    private String latlng;
    private String latitude;
    private String longitude;
    private double intension;

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

    public void setCount(int count) {
        this.count = count;
    }
}
