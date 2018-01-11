package org.thealpha.model;

/**
 * Created by kangwenjie on 18-1-5.
 */
public class User {
    private String index;
    private String email;
    private String password;
    private String name;
    private String sex;
    private String position;
    private String org;
    private String nation;
    private String bornDate;
    private String supervisorName;
    private String gradDate;
    private String gradCollege;
    private String degree;
    private String personalPhoto;
    private String researchField;

    public String getPersonalPhoto() {
        return personalPhoto;
    }

    public void setPersonalPhoto(String personalPhoto) {
        this.personalPhoto = personalPhoto;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getResearchField() {
        return researchField;
    }

    public void setResearchField(String researchField) {
        this.researchField = researchField;
    }

    public String getIndex() {
        return index;
    }

    public void setIndex(String index) {
        this.index = index;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getOrg() {
        return org;
    }

    public void setOrg(String org) {
        this.org = org;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getBornDate() {
        return bornDate;
    }

    public void setBornDate(String bornDate) {
        this.bornDate = bornDate;
    }

    public String getSupervisorName() {
        return supervisorName;
    }

    public void setSupervisorName(String supervisorName) {
        this.supervisorName = supervisorName;
    }

    public String getGradDate() {
        return gradDate;
    }

    public void setGradDate(String gradDate) {
        this.gradDate = gradDate;
    }

    public String getGradCollege() {
        return gradCollege;
    }

    public void setGradCollege(String gradCollege) {
        this.gradCollege = gradCollege;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }
}
