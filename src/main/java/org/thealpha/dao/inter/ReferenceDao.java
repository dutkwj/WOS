package org.thealpha.dao.inter;

import org.thealpha.model.Paper;

import java.util.List;

/**
 * Created by kangwenjie on 17-12-16.
 */
public interface ReferenceDao {
    public List<String> getRefPaperIdsByPaperId(String paperId);
    public List<String> getRefPaperIdsByPaperIds(List<String> paperIds);
    public List<String> getRefedPaperIdsByPaperIds(List<String> paperIds);
    public List<String> getCoRefPapersByPaperIds(List<String> paperIds);
    public List<String> getCoRefedPapersByPaperIds(List<String> paperIds);

}
