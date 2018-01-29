package org.thealpha.dao.imple;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.data.hadoop.hbase.RowMapper;
import org.springframework.stereotype.Repository;
import org.thealpha.dao.inter.RecommendDao;
import org.thealpha.model.ScholarWeight;
import org.thealpha.model.User;
import org.thealpha.util.ConfigurationConstant;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by kangwenjie on 18-1-12.
 */
@Repository
public class RecommendDaoImpl implements RecommendDao{

    @Autowired
    private HbaseTemplate hbaseTemplate;

    public List<ScholarWeight> getScholarWeightsByUser(String email) {
        return hbaseTemplate.get(ConfigurationConstant.TABLE_CS_USER, email, new RowMapper<List<ScholarWeight>>() {
            public List<ScholarWeight> mapRow(Result result, int rowNum) throws Exception {
                String scholarWeight = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_SCAN_RECORD), Bytes.toBytes(ConfigurationConstant.QF_WEIGHT)));
                if (StringUtils.isNotBlank(scholarWeight)) {
                    List<ScholarWeight> scholarWeightList = new ArrayList<ScholarWeight>();
                    for (String weight : scholarWeight.split(", ")) {
                        ScholarWeight sw = new ScholarWeight();
                        sw.setIndex(weight.substring(0, weight.indexOf(":")));
                        sw.setWeight(Integer.parseInt(weight.substring(weight.indexOf(":") + 1)));
                        scholarWeightList.add(sw);
                    }
                    return scholarWeightList;
                }
                return null;
            }
        });
    }

    public void setScholarWeights(String email, List<ScholarWeight> scholarWeights) {
        if (CollectionUtils.isEmpty(scholarWeights)) {
            return;
        }
        StringBuilder sw = new StringBuilder();
        for (ScholarWeight scholarWeight : scholarWeights) {
            sw.append(scholarWeight.getIndex() + ":" + String.valueOf(scholarWeight.getWeight()) + ", ");
        }
        hbaseTemplate.put(ConfigurationConstant.TABLE_CS_USER, email, ConfigurationConstant.CF_SCAN_RECORD, ConfigurationConstant.QF_WEIGHT, Bytes.toBytes(sw.substring(0, sw.lastIndexOf(","))));
    }

    public List<User> getAllScholarWeights() {
        return hbaseTemplate.find(ConfigurationConstant.TABLE_CS_USER, ConfigurationConstant.CF_SCAN_RECORD, ConfigurationConstant.QF_WEIGHT, new RowMapper<User>() {
            public User mapRow(org.apache.hadoop.hbase.client.Result result, int rowNum) throws Exception {
                String scholarWeights = Bytes.toString(result.value());
                if (StringUtils.isBlank(scholarWeights)) {
                    return null;
                }
                List<ScholarWeight> scholarWeightList = new ArrayList<ScholarWeight>();
                for (String scholarWeight : scholarWeights.split(", ")) {
                    ScholarWeight sw = new ScholarWeight();
                    sw.setIndex(scholarWeight.substring(0, scholarWeight.indexOf(":")));
                    sw.setWeight(Integer.parseInt(scholarWeight.substring(scholarWeight.indexOf(":") + 1)));
                    scholarWeightList.add(sw);
                }
                String eamil = Bytes.toString(result.getRow());
                User user = new User();
                user.setEmail(eamil);
                user.setScholarWeights(scholarWeightList);
                return user;
            }
        });
    }
}
