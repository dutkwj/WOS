package org.thealpha.model;

/**
 * Created by kangwenjie on 17-12-20.
 */
public class SearchItem {
    private String scholarName;
    private String affName;
    private String minQindex;
    private String maxQindex;
    private String minHindex;
    private String maxHindex;

    public String getMinQindex() {
        return minQindex;
    }

    public void setMinQindex(String minQindex) {
        this.minQindex = minQindex;
    }

    public String getMaxQindex() {
        return maxQindex;
    }

    public void setMaxQindex(String maxQindex) {
        this.maxQindex = maxQindex;
    }

    public String getMinHindex() {
        return minHindex;
    }

    public void setMinHindex(String minHindex) {
        this.minHindex = minHindex;
    }

    public String getMaxHindex() {
        return maxHindex;
    }

    public void setMaxHindex(String maxHindex) {
        this.maxHindex = maxHindex;
    }

    public String getScholarName() {
        return scholarName;
    }

    public void setScholarName(String scholarName) {
        this.scholarName = scholarName;
    }

    public String getAffName() {
        return affName;
    }

    public void setAffName(String affName) {
        this.affName = affName;
    }
}
