package org.thealpha.service;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thealpha.dao.inter.ScholarCoTeamDao;
import org.thealpha.dao.inter.ScholarCooperateDao;
import org.thealpha.dao.inter.ScholarInfoDao;
import org.thealpha.model.Cooperater;
import org.thealpha.model.Scholar;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by kangwenjie on 17-12-14.
 */
@Service
public class ScholarCoTeamService {

    @Autowired
    private ScholarCooperateDao scholarCooperateDao;

    @Autowired
    private ScholarCoTeamDao scholarCoTeamDao;

    @Autowired
    private ScholarInfoDao scholarInfoDao;

    public List<Cooperater> getCoTeamersById(String scholarId) {
        List<Cooperater> coTeamerList = scholarCoTeamDao.getCooperatersById(scholarId);
        if (CollectionUtils.isEmpty(coTeamerList)) {
            return null;
        }
        List<String> scholarIds = new ArrayList<String>();
        double minIntension = Double.MAX_VALUE;
        for (Cooperater cooperater : coTeamerList) {
            scholarIds.add(cooperater.getIndex());
            if (cooperater.getIntension() < minIntension) {
                minIntension = cooperater.getIntension();
            }
        }
        List<Scholar> scholarList = scholarInfoDao.getScholarsByIds(scholarIds);

        Map<String, Scholar> scholarIdObjectMap = new HashMap<String, Scholar>();
        for (Scholar scholar : scholarList) {
            scholarIdObjectMap.put(scholar.getIndex(), scholar);
        }
        for (Cooperater cooperater : coTeamerList) {
            cooperater.setName(scholarIdObjectMap.get(cooperater.getIndex()).getName());
            cooperater.setHindex(scholarIdObjectMap.get(cooperater.getIndex()).getHindex());
            cooperater.setAff(scholarIdObjectMap.get(cooperater.getIndex()).getAff());
            cooperater.setFieldName(scholarIdObjectMap.get(cooperater.getIndex()).getFieldName());
            cooperater.setIntension(cooperater.getIntension() / minIntension);
            cooperater.setLatlng(scholarIdObjectMap.get(cooperater.getIndex()).getLatlng());
            cooperater.setLatitude(scholarIdObjectMap.get(cooperater.getIndex()).getLatitude());
            cooperater.setLongitude(scholarIdObjectMap.get(cooperater.getIndex()).getLongitude());
            cooperater.setCoTeamNumber(scholarIdObjectMap.get(cooperater.getIndex()).getCoTeamNumber());

        }
        return coTeamerList;
    }
}
