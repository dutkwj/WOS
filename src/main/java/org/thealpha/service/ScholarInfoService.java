package org.thealpha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thealpha.dao.inter.ScholarInfoDao;
import org.thealpha.model.Scholar;
import org.thealpha.model.SearchItem;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
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

    public List<Scholar> getMoreRecommendScholars() {
        List<String> moreRecommendScholars = scholarInfoDao.getMoreRecommendScholars();
        return getScholarsByIds(moreRecommendScholars);
    }

    public List<Scholar> getScholarsByIds(List<String> scholarIds) {
        return scholarInfoDao.getScholarsByIds(scholarIds);
    }

    public Scholar getScholarById(String scholarId) {
        return scholarInfoDao.getScholarById(scholarId);
    }

    public List<Scholar> getScholarsBySearchItems(SearchItem searchItem) throws IOException {
        List<String> scholarIds = scholarInfoDao.getScholarIdsBySearchItem(searchItem);
        if (scholarIds.size() > 200) {
//            降序的100名学者
            List<String> downScholarIds = scholarIds.subList(0, 100);
//            升序的100名学者
            List<String> upScholarIds = scholarIds.subList(scholarIds.size() - 100, scholarIds.size());
            downScholarIds.addAll(upScholarIds);
            scholarIds = downScholarIds;
        }
        List<Scholar> scholars = scholarInfoDao.getScholarsByIds(scholarIds);
        return scholars;
    }
}
