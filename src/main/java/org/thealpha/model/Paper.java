package org.thealpha.model;

import java.util.List;

/**
 * Created by kangwenjie on 17-12-16.
 */
public class Paper {
    private String index;
    private List<String> authorIds;
    private List<String> refPaperIds;
    private List<String> refedPaperIds;
    private List<String> coRefPapers;
    private List<String> coRefedPapers;

    public String getIndex() {
        return index;
    }

    public void setIndex(String index) {
        this.index = index;
    }

    public List<String> getAuthorIds() {
        return authorIds;
    }

    public void setAuthorIds(List<String> authorIds) {
        this.authorIds = authorIds;
    }

    public List<String> getRefPaperIds() {
        return refPaperIds;
    }

    public void setRefPaperIds(List<String> refPaperIds) {
        this.refPaperIds = refPaperIds;
    }

    public List<String> getRefedPaperIds() {
        return refedPaperIds;
    }

    public void setRefedPaperIds(List<String> refedPaperIds) {
        this.refedPaperIds = refedPaperIds;
    }

    public List<String> getCoRefPapers() {
        return coRefPapers;
    }

    public void setCoRefPapers(List<String> coRefPapers) {
        this.coRefPapers = coRefPapers;
    }

    public List<String> getCoRefedPapers() {
        return coRefedPapers;
    }

    public void setCoRefedPapers(List<String> coRefedPapers) {
        this.coRefedPapers = coRefedPapers;
    }
}
