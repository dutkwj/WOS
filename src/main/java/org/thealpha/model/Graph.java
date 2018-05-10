package org.thealpha.model;

import java.util.List;

/**
 * Created by kangwenjie on 18-4-11.
 */
public class Graph {
    private List<Category> categories;
    private List<Node> nodes;
    private List<Link> links;

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }

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
}
