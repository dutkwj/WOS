package org.thealpha.model;

import java.io.Serializable;
import java.util.List;

/**
 * Created by kangwenjie on 18-4-11.
 */
public class Graph implements Serializable{
    private List<Node> nodes;
    private List<Link> links;
    private int maxsize;
    private int minsize;
    private int maxlink;
    private int minlink;

    public List<Node> getNodes() {
        return nodes;
    }

    public void setNodes(List<Node> nodes) {
        this.nodes = nodes;
    }

    public List<Link> getLinks() {
        return links;
    }

    public void setLinks(List<Link> links) {
        this.links = links;
    }

    public int getMaxsize() {
        return maxsize;
    }

    public void setMaxsize(int maxsize) {
        this.maxsize = maxsize;
    }

    public int getMinsize() {
        return minsize;
    }

    public void setMinsize(int minsize) {
        this.minsize = minsize;
    }

    public int getMaxlink() {
        return maxlink;
    }

    public void setMaxlink(int maxlink) {
        this.maxlink = maxlink;
    }

    public int getMinlink() {
        return minlink;
    }

    public void setMinlink(int minlink) {
        this.minlink = minlink;
    }
}
