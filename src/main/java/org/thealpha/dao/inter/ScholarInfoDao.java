package org.thealpha.dao.inter;

import org.thealpha.model.Scholar;

import java.util.List;
import java.util.Map;

/**
 * Created by kangwenjie on 17-12-14.
 */
public interface ScholarInfoDao {
    public List<String> getRecommendScholars();
    public List<Scholar> getScholarsByIds(List<String> scholarIds);
    public Scholar getScholarById(String scholarId);
}
