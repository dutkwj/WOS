package org.thealpha.dao.imple;

import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;
import org.mortbay.util.StringUtil;
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

    public User getUserNameAndPhotoNameByEmail(final String email) {
        return hbaseTemplate.get(ConfigurationConstant.TABLE_CS_USER, email, new RowMapper<User>() {
            public User mapRow(Result result, int rowNum) throws Exception {
                User user = new User();
                String name = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO), Bytes.toBytes(ConfigurationConstant.QF_NAME)));
                String personalPhotoName = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO), Bytes.toBytes(ConfigurationConstant.QF_PERSONAL_PHOTO_NAME)));
                user.setEmail(email);
                if (StringUtils.isNotBlank(name)) {
                    user.setName(name);
                }
                if (StringUtils.isNotBlank(personalPhotoName)) {
                    user.setPersonalPhoto(personalPhotoName);
                }
                user.setEmail(email);
//                System.out.println("////////?!!!!!!!!!!!!" + email);
                return user;
            }
        });
    }

    public User getUserInfoByEmail(final String email){
//        System.out.println("////////?!!!!!!!!!!!!" );
        return hbaseTemplate.get(ConfigurationConstant.TABLE_CS_USER, email, new RowMapper<User>() {
            public User mapRow(Result result, int rowNum) throws Exception {
                User user =new User();

                String index = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO),Bytes.toBytes(ConfigurationConstant.QF_INDEX)));
                String name = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO),Bytes.toBytes(ConfigurationConstant.QF_NAME)));
                String sex = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO),Bytes.toBytes(ConfigurationConstant.QF_SEX)));
                String position = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO),Bytes.toBytes(ConfigurationConstant.QF_POSITION)));
                String org = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO),Bytes.toBytes(ConfigurationConstant.QF_ORG)));
                String nation = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO),Bytes.toBytes(ConfigurationConstant.QF_NATION)));
                String bornDate = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO),Bytes.toBytes(ConfigurationConstant.QF_BORN_DATE)));
                String supervisorName = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO),Bytes.toBytes(ConfigurationConstant.QF_SUPERVISOR_NAME)));
                String gradDate = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO),Bytes.toBytes(ConfigurationConstant.QF_GRAD_DATE)));
                String gradCollege = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO),Bytes.toBytes(ConfigurationConstant.QF_GRAD_college)));
                String degree = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO),Bytes.toBytes(ConfigurationConstant.QF_DEGREE)));
                String personalPhoto = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO),Bytes.toBytes(ConfigurationConstant.QF_PERSONAL_PHOTO_NAME)));
                String researchField = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_USER_INFO),Bytes.toBytes(ConfigurationConstant.QF_RESEARCH_FIELD)));
                user.setEmail(email);
                if(StringUtils.isNotBlank(index)){
                    user.setIndex(index);
                }
                if(StringUtils.isNotBlank(name)){
                    user.setName(name);
                }
                if(StringUtils.isNotBlank(sex)){
                    user.setSex(sex);
                }
                if(StringUtils.isNotBlank(position)){
                    user.setPosition(position);
                }
                if(StringUtils.isNotBlank(org)){
                    user.setOrg(org);
                }
                if(StringUtils.isNotBlank(nation)){
                    user.setNation(nation);
                }
                if(StringUtils.isNotBlank(bornDate)){
                    user.setBornDate(bornDate);
                }
                if(StringUtils.isNotBlank(supervisorName)){
                    user.setSupervisorName(supervisorName);
                }
                if(StringUtils.isNotBlank(gradDate)){
                    user.setGradDate(gradDate);
                }
                if(StringUtils.isNotBlank(gradCollege)){
                    user.setGradCollege(gradCollege);
                }
                if(StringUtils.isNotBlank(degree)){
                    user.setDegree(degree);
                }
                if(StringUtils.isNotBlank(personalPhoto)){
                    user.setPersonalPhoto(personalPhoto);
                }
                if(StringUtils.isNotBlank(researchField)){
                    user.setResearchField(researchField);
                }

                return user;
            }
        });
    }

    public boolean modifyPsd(String email, String qualifier, String field) {
        hbaseTemplate.put(ConfigurationConstant.TABLE_CS_USER, email, ConfigurationConstant.CF_USER_INFO, qualifier, Bytes.toBytes(field));
        return true;
    }

    public boolean modifyInfo(String email,String qualifier,String field){
        hbaseTemplate.put(ConfigurationConstant.TABLE_CS_USER,email,ConfigurationConstant.CF_USER_INFO,qualifier,Bytes.toBytes(field));
        return true;
    }



}
