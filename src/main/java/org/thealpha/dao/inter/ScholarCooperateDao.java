package org.thealpha.dao.inter;

import org.thealpha.model.Cooperater;

import java.util.List;
import java.util.Map;

/**
 * Created by kangwenjie on 17-12-14.
 */
public interface ScholarCooperateDao {
    public Map<String, String> getAllCooperateScholar();
    public List<Cooperater> getCooperatersById(String id);
}
