package org.thealpha.dao.inter;

import java.util.List;
import java.util.Map;

/**
 * Created by kangwenjie on 17-12-16.
 */
public interface PaperDao {
    public List<String> getPaperIdsByAuthorId(String authorId);
    public List<String> getAuthorIdsByPaperId(String paperId);
    public List<String> getAuthorIdsByPaperIds(List<String> paperIds);
    public Map<String, List<String>> getPaperIdAuthorIdsMapByPaperIds(List<String> paperIds);
}
