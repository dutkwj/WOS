package org.thealpha.model;

/**
 * Created by kangwenjie on 18-4-11.
 */
public class Link {
    private String source;
    private String target;
    private int coCount;

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
