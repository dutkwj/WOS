package org.thealpha.dao.inter;

import org.thealpha.model.*;

//import java.time.Year;
import java.util.List;
import java.util.Map;

/**
 * Created by kangwenjie on 17-12-14.
 */
public interface ScholarCooperateDao {
    public Map<String, String> getAllCooperateScholar();
    public List<Cooperater> getCooperatersById(String id);
    public List<Cooperater> getCooperatersIntensityById(String id);
    public Map<String, Double> getCoIntensitymapById(String id);
    public List<Cooperater> getMVCsById(String id);
    public List<YearCount> getCooperateYearCountsById(String id);
    public List<FirstCoYear> getFirstCooperateYearById(String id);
    public List<Cooperater> getEveryYearCollaboratorsById(String id);
    public List<Yearnumber> getEveryYearPapernumberById(String id);
    public List<String> getCollaboratorsYearById(String id);
    public List<YearConumber> getYearConumbersById(String id);
}
