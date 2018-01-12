package org.thealpha.dao.imple;

import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.data.hadoop.hbase.RowMapper;
import org.springframework.stereotype.Repository;
import org.thealpha.dao.inter.UserDao;
import org.thealpha.model.User;
import org.thealpha.util.ConfigurationConstant;

/**
 * Created by kangwenjie on 18-1-12.
 */
@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private HbaseTemplate hbaseTemplate;

    public boolean verifyUser(String email, final String password) {
        return hbaseTemplate.get(ConfigurationConstant.TABLE_CS_USER, email, new RowMapper<Boolean>() {
            public Boolean mapRow(Result result, int rowNum) throws Exception {
                String realPass = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO), Bytes.toBytes(ConfigurationConstant.QF_PASSWORD)));
                if (StringUtils.equals(password, realPass)) {
                    return true;
                } else {
                    return false;
                }
            }
        });
    }

    public User getUserNameAndPhotoNameByEmail(String email) {
        return hbaseTemplate.get(ConfigurationConstant.TABLE_CS_USER, email, new RowMapper<User>() {
            public User mapRow(Result result, int rowNum) throws Exception {
                User user = new User();
                String name = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO), Bytes.toBytes(ConfigurationConstant.QF_NAME)));
                String personalPhotoName = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO), Bytes.toBytes(ConfigurationConstant.QF_PERSONAL_PHOTO_NAME)));
                if (StringUtils.isNotBlank(name)) {
                    user.setName(name);
                }
                if (StringUtils.isNotBlank(personalPhotoName)) {
                    user.setPersonalPhoto(personalPhotoName);
                }
                return user;
            }
        });
    }
}
