package org.thealpha.dao.imple;

import org.springframework.stereotype.Repository;
import org.thealpha.dao.inter.ScholarInfoDao;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by kangwenjie on 17-12-14.
 */
@Repository
public class ScholarInfoDaoImpl implements ScholarInfoDao{
    public List<String> getRecmondAuthors() {
        List<String> recomendAuthors = new ArrayList<String>();
        recomendAuthors.add("0DE9F497");
        recomendAuthors.add("80E2C811");
        recomendAuthors.add("7FC8CD3A");
        recomendAuthors.add("82B4E787");
        recomendAuthors.add("80E2C818");

        return recomendAuthors;
    }
}
