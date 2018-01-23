package org.thealpha.model;

/**
 * Created by kangwenjie on 17-12-20.
 */
public class SearchItem {
    private String scholarName;
    private String affName;
    private String qindex;
    private String hindex;

    public String getQindex() {
        return qindex;
    }

    public void setQindex(String qindex) {
        this.qindex = qindex;
    }

    public String getHindex() {
        return hindex;
    }

    public void setHindex(String hindex) {
        this.hindex = hindex;
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
