package org.thealpha.service;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thealpha.dao.inter.UserDao;
import org.thealpha.model.User;
import org.thealpha.util.ConfigurationConstant;

/**
 * Created by kangwenjie on 18-1-12.
 */
@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public boolean verifyUser(String email, String password) {
        return userDao.verifyUser(email, password);
    }

    public User getUserNameAndPhotoNameByEmail(String email) {
        return userDao.getUserNameAndPhotoNameByEmail(email);
    }

    public User getUserInfoByEmail(String email){
        return userDao.getUserInfoByEmail(email);
    }

    public boolean modifyPsd(User user) {
        String email = user.getEmail();
//        System.out.println("####$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"+user);
        if (StringUtils.isNotBlank(user.getPassword())) {
            userDao.modifyPsd(email, ConfigurationConstant.QF_PASSWORD, user.getPassword());
            return true;
        }else{
            return false;
        }
    }
    public boolean modifyInfo(User user) {
        String email = user.getEmail();
        int i =0;
        if (StringUtils.isNotBlank(user.getIndex())) {
            userDao.modifyInfo(email, ConfigurationConstant.QF_INDEX, user.getIndex());
            i+=1;
        }
        if (StringUtils.isNotBlank(user.getName())) {
            userDao.modifyInfo(email, ConfigurationConstant.QF_NAME, user.getName());
            i+=1;
        }
        if (StringUtils.isNotBlank(user.getSex())) {
            userDao.modifyInfo(email, ConfigurationConstant.QF_SEX, user.getSex());
            i+=1;
        }
        if (StringUtils.isNotBlank(user.getPosition())) {
            userDao.modifyInfo(email, ConfigurationConstant.QF_POSITION, user.getPosition());
            i+=1;
        }
        if (StringUtils.isNotBlank(user.getOrg())) {
            userDao.modifyInfo(email, ConfigurationConstant.QF_ORG, user.getOrg());
            i+=1;
        }
        if (StringUtils.isNotBlank(user.getNation())) {
            userDao.modifyInfo(email, ConfigurationConstant.QF_NATION, user.getNation());
            i+=1;
        }
        if (StringUtils.isNotBlank(user.getBornDate())) {
            userDao.modifyInfo(email, ConfigurationConstant.QF_BORN_DATE, user.getBornDate());
            i+=1;
        }
        if (StringUtils.isNotBlank(user.getSupervisorName())) {
            userDao.modifyInfo(email, ConfigurationConstant.QF_SUPERVISOR_NAME, user.getSupervisorName());
            i+=1;
        }
        if (StringUtils.isNotBlank(user.getGradDate())) {
            userDao.modifyInfo(email, ConfigurationConstant.QF_GRAD_DATE, user.getGradDate());
            i+=1;
        }
        if (StringUtils.isNotBlank(user.getGradCollege())) {
            userDao.modifyInfo(email, ConfigurationConstant.QF_GRAD_college, user.getGradCollege());
            i+=1;
        }
        if (StringUtils.isNotBlank(user.getDegree())) {
            userDao.modifyInfo(email, ConfigurationConstant.QF_DEGREE, user.getDegree());
            i+=1;
        }
        if (StringUtils.isNotBlank(user.getPersonalPhoto())) {
            userDao.modifyInfo(email, ConfigurationConstant.QF_PERSONAL_PHOTO_NAME, user.getPersonalPhoto());
            i+=1;
        }
        if (StringUtils.isNotBlank(user.getResearchField())) {
            userDao.modifyInfo(email, ConfigurationConstant.QF_RESEARCH_FIELD, user.getResearchField());
            i+=1;
        }
        if(i == 0){
            return false;
        }else{
            return true;
        }
    }
}
