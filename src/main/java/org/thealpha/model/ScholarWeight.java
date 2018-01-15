package org.thealpha.model;

/**
 * Created by kangwenjie on 18-1-12.
 */
public class ScholarWeight {
    private String index;
    private int weight;
    private double recommendIndex;

    public double getRecommendIndex() {
        return recommendIndex;
    }

    public void setRecommendIndex(double recommendIndex) {
        this.recommendIndex = recommendIndex;
    }

    public String getIndex() {
        return index;
    }

    public void setIndex(String index) {
        this.index = index;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }
}
