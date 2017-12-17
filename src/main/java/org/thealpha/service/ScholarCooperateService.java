package org.thealpha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thealpha.dao.inter.ScholarCooperateDao;
import org.thealpha.dao.inter.ScholarInfoDao;
import org.thealpha.model.Cooperater;
import org.thealpha.model.Scholar;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by kangwenjie on 17-12-14.
 */
@Service
public class ScholarCooperateService {

    @Autowired
    private ScholarCooperateDao scholarCooperateDao;

    @Autowired
    private ScholarInfoDao scholarInfoDao;

    public Map<String, String> getAllCooperate() {
        return scholarCooperateDao.getAllCooperateScholar();
    }

    public List<Cooperater> getCooperaterById(String scholarId) {
        List<Cooperater> cooperaterList = scholarCooperateDao.getCooperatersById(scholarId);
        List<String> scholarIds = new ArrayList<String>();
        for (Cooperater cooperater : cooperaterList) {
            scholarIds.add(cooperater.getIndex());
        }
        List<Scholar> scholarList = scholarInfoDao.getScholarsByIds(scholarIds);

        Map<String, String> scholarIdNameMap = new HashMap<String, String>();
        for (Scholar scholar : scholarList) {
            scholarIdNameMap.put(scholar.getIndex(), scholar.getName());
        }
        for (Cooperater cooperater : cooperaterList) {
            cooperater.setName(scholarIdNameMap.get(cooperater.getIndex()));
        }
        return cooperaterList;
    }
}
