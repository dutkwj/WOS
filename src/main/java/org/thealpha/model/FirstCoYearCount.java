package org.thealpha.model;

import java.util.List;

/**
 * Created by kangwenjie on 18-1-2.
 */
public class FirstCoYearCount {
    private int year;
    private int count;
    private List<String> students;
    public List<String> getStudents(){
        return students;
    }
    public void setStudents(List<String> students){
        this.students=students;
    }
    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }
    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

}
