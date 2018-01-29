package org.thealpha.service;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thealpha.dao.inter.RegisterDao;
import org.thealpha.model.User;
import org.thealpha.util.ConfigurationConstant;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by kangwenjie on 18-1-4.
 */
@Service
public class RegisterService {

    @Autowired
    private RegisterDao registerDao;

    public List<String> getAllCountriesName() {
        String countryNames = "Angola,Afghanistan,Albania,Algeria,Andorra,Anguilla,Antigua and Barbuda,Argentina,Armenia,Ascension,Australia,Austria,Azerbaijan,Bahamas,Bahrain,Bangladesh,Barbados,Belarus,Belgium,Belize,Benin,Bermuda Is,Bolivia,Botswana,Brazil,Brunei,Bulgaria,Burkina Faso,Burma,Burundi,Cameroon,Canada,Cayman Is,Central African Republic,Chad,Chile,China,Colombia,Congo,Cook Is,Costa Rica,Cuba,Cyprus,Czech Republic,Denmark,Djibouti,Dominica Rep,Ecuador,Egypt,EI Salvador,Estonia,Ethiopia,Fiji,Finland,France,French Guiana,French Polynesia,Gabon,Gambia,Georgia,Germany,Ghana,Gibraltar,Greece,Grenada,Guam,Guatemala,Guinea,Guyana,Haiti,Honduras,Hongkong,Hungary,Iceland,India,Indonesia,Iran,Iraq,Ireland,Israel,Italy,Ivory Coast,Jamaica,Japan,Jordan,Kampuchea (Cambodia ),Kazakstan,Kenya,Korea,Kuwait,Kyrgyzstan,Laos,Latvia,Lebanon,Lesotho,Liberia,Libya,Liechtenstein,Lithuania,Luxembourg,Macao,Madagascar,Malawi,Malaysia,Maldives,Mali,Malta,Mariana Is,Martinique,Mauritius,Mexico,Moldova,Monaco,Mongolia,Montserrat Is,Morocco,Mozambique,Namibia,Nauru,Nepal,Netheriands Antilles,Netherlands,New Zealand,Nicaragua,Niger,Nigeria,North Korea,Norway,Oman,Pakistan,Panama,Papua New Cuinea,Paraguay,Peru,Philippines,Poland,Portugal,Puerto Rico,Qatar,Reunion,Romania,Russia,Saint Lueia,Saint Vincent,Samoa Eastern,Samoa Western,San Marino,Sao Tome and Principe,Saudi Arabia,Senegal,Seychelles,Sierra Leone,Singapore,Slovakia,Slovenia,Solomon Is,Somali,South Africa,Spain,SriLanka,St.Lucia,St.Vincent,Sudan,Suriname,Swaziland,Sweden,Switzerland,Syria,Taiwan,Tajikstan,Tanzania,Thailand,Togo,Tonga,Trinidad and Tobago,Tunisia,Turkey,Turkmenistan,Uganda,Ukraine,United Arab Emirates,United Kiongdom,United States of America,Uruguay,Uzbekistan,Venezuela,Vietnam,Yemen,Yugoslavia,Zimbabwe,Zaire,Zambia";
        ArrayList<String> countryNameList = new ArrayList<String>();
        for (String name : countryNames.split(",")) {
            countryNameList.add(name);
        }
        return countryNameList;
    }

    public void saveUser(User user) {
        String email = user.getEmail();
        if (StringUtils.isNotBlank(user.getIndex())) {
            registerDao.saveUser(email, ConfigurationConstant.QF_INDEX, user.getIndex());
        }
        if (StringUtils.isNotBlank(user.getPassword())) {
            registerDao.saveUser(email, ConfigurationConstant.QF_PASSWORD, user.getPassword());
        }
        if (StringUtils.isNotBlank(user.getName())) {
            registerDao.saveUser(email, ConfigurationConstant.QF_NAME, user.getName());
        }
        if (StringUtils.isNotBlank(user.getSex())) {
            registerDao.saveUser(email, ConfigurationConstant.QF_SEX, user.getSex());
        }
        if (StringUtils.isNotBlank(user.getPosition())) {
            registerDao.saveUser(email, ConfigurationConstant.QF_POSITION, user.getPosition());
        }
        if (StringUtils.isNotBlank(user.getOrg())) {
            registerDao.saveUser(email, ConfigurationConstant.QF_ORG, user.getOrg());
        }
        if (StringUtils.isNotBlank(user.getNation())) {
            registerDao.saveUser(email, ConfigurationConstant.QF_NATION, user.getNation());
        }
        if (StringUtils.isNotBlank(user.getBornDate())) {
            registerDao.saveUser(email, ConfigurationConstant.QF_BORN_DATE, user.getBornDate());
        }
        if (StringUtils.isNotBlank(user.getSupervisorName())) {
            registerDao.saveUser(email, ConfigurationConstant.QF_SUPERVISOR_NAME, user.getSupervisorName());
        }
        if (StringUtils.isNotBlank(user.getGradDate())) {
            registerDao.saveUser(email, ConfigurationConstant.QF_GRAD_DATE, user.getGradDate());
        }
        if (StringUtils.isNotBlank(user.getGradCollege())) {
            registerDao.saveUser(email, ConfigurationConstant.QF_GRAD_college, user.getGradCollege());
        }
        if (StringUtils.isNotBlank(user.getDegree())) {
            registerDao.saveUser(email, ConfigurationConstant.QF_DEGREE, user.getDegree());
        }
        if (StringUtils.isNotBlank(user.getPersonalPhoto())) {
            registerDao.saveUser(email, ConfigurationConstant.QF_PERSONAL_PHOTO_NAME, user.getPersonalPhoto());
        }
        if (StringUtils.isNotBlank(user.getResearchField())) {
            registerDao.saveUser(email, ConfigurationConstant.QF_RESEARCH_FIELD, user.getResearchField());
        }
    }

    public boolean isEmailExist(String email) {
        return registerDao.isEmailExist(email);
    }
}
