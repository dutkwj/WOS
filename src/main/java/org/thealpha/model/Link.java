package org.thealpha.model;

import java.io.Serializable;

/**
 * Created by kangwenjie on 18-4-11.
 */
public class Link implements Serializable{
    private String source;
    private String target;
    private int coCount;
    private double intensity;
    private String time;

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public double getIntensity() {
        return intensity;
    }

    public void setIntensity(double intensity) {
        this.intensity = intensity;
    }

    public int getCoCount() {
        return coCount;
    }

    public void setCoCount(int coCount) {
        this.coCount = coCount;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

}
