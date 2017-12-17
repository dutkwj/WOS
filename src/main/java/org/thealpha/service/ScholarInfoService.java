package org.thealpha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thealpha.dao.inter.ScholarInfoDao;
import org.thealpha.model.Scholar;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by kangwenjie on 17-12-15.
 */
@Service
public class ScholarInfoService {
    @Autowired
    private ScholarInfoDao scholarInfoDao;

    public List<Scholar> getRecommendScholars() {
        List<String> recommendScholarIds = scholarInfoDao.getRecommendScholars();
        return getScholarsByIds(recommendScholarIds);
    }

    public List<Scholar> getScholarsByIds(List<String> scholarIds) {
        return scholarInfoDao.getScholarsByIds(scholarIds);
    }

    public Scholar getScholarById(String scholarId) {
        return scholarInfoDao.getScholarById(scholarId);
    }
}
