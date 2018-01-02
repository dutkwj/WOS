package org.thealpha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thealpha.dao.inter.ScholarCooperateDao;
import org.thealpha.dao.inter.ScholarInfoDao;
import org.thealpha.model.Cooperater;
import org.thealpha.model.Scholar;
import org.thealpha.model.YearCount;

import javax.annotation.Resource;
import java.util.*;

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

        Map<String, Scholar> scholarIdObjectMap = new HashMap<String, Scholar>();
        for (Scholar scholar : scholarList) {
            scholarIdObjectMap.put(scholar.getIndex(), scholar);
        }
        for (Cooperater cooperater : cooperaterList) {
            cooperater.setName(scholarIdObjectMap.get(cooperater.getIndex()).getName());
            cooperater.setAff(scholarIdObjectMap.get(cooperater.getIndex()).getAff());
            cooperater.setLatlng(scholarIdObjectMap.get(cooperater.getIndex()).getLatlng());
            cooperater.setLatitude(scholarIdObjectMap.get(cooperater.getIndex()).getLatitude());
            cooperater.setLongitude(scholarIdObjectMap.get(cooperater.getIndex()).getLongitude());
        }
        return cooperaterList;
    }

    public List<YearCount> getCooperateYearCountsById(String scholarId) {
        List<YearCount> yearCounts = scholarCooperateDao.getCooperateYearCountsById(scholarId);
//        去掉1980年之前的，合作者数量在20以上的按20算
        List<Integer> years = new ArrayList<Integer>();
        for (YearCount yearCount: yearCounts) {
            int year = yearCount.getYear();
            int count = yearCount.getCount();
            if (year < 1980) {
                yearCounts.remove(yearCount);
                continue;
            } else {
                years.add(year);
            }
            if (count > 20) {
                count = 20;
                yearCount.setCount(count);
            }
        }
        for (int i = 1980; i < 2017; i++) {
            if (!years.contains(i)) {
                YearCount yearCount = new YearCount();
                yearCount.setYear(i);
                yearCount.setCount(0);
                yearCounts.add(yearCount);
            }
        }
        Collections.sort(yearCounts, new Comparator<YearCount>() {
            public int compare(YearCount o1, YearCount o2) {
                return new Integer(o1.getYear()).compareTo(new Integer(o2.getYear()));
            }
        });
        return yearCounts;
    }
}
