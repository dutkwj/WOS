package org.thealpha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thealpha.dao.inter.ScholarCooperateDao;

import javax.annotation.Resource;
import java.util.Map;

/**
 * Created by kangwenjie on 17-12-14.
 */
@Service
public class ScholarCooperateService {

    @Autowired
    private ScholarCooperateDao scholarCooperateDao;

    public Map<String, String> getAllCooperate() {
        return scholarCooperateDao.getAllCooperateScholar();
    }
}
