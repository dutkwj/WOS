package org.thealpha.dao.inter;

import org.thealpha.model.Scholar;
import org.thealpha.model.SearchItem;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by kangwenjie on 17-12-14.
 */
public interface ScholarInfoDao {
    public List<String> getRecommendScholars();
    public List<String> getMoreRecommendScholars();
    public List<Scholar> getScholarsByIds(List<String> scholarIds);
    public Scholar getScholarById(String scholarId);
    public List<String> getScholarIdsBySearchItem(SearchItem searchItem) throws IOException;
}
