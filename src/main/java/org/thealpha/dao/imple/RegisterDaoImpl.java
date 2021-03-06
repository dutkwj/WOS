package org.thealpha.dao.imple;

import org.apache.hadoop.hbase.util.Bytes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.data.hadoop.hbase.RowMapper;
import org.springframework.stereotype.Repository;
import org.thealpha.dao.inter.RegisterDao;
import org.thealpha.util.ConfigurationConstant;

/**
 * Created by kangwenjie on 18-1-9.
 */
@Repository
public class RegisterDaoImpl implements RegisterDao{

    @Autowired
    private HbaseTemplate hbaseTemplate;

    public void saveUser(String email, String qualifier, String field) {
        hbaseTemplate.put(ConfigurationConstant.TABLE_CS_USER, email, ConfigurationConstant.CF_USER_INFO, qualifier, Bytes.toBytes(field));
    }

    public boolean isEmailExist(String email) {
        return hbaseTemplate.get(ConfigurationConstant.TABLE_CS_USER, email, new RowMapper<Boolean>() {
            public Boolean mapRow(org.apache.hadoop.hbase.client.Result result, int rowNum) throws Exception {
                return !result.isEmpty();
            }
        });
    }
}
