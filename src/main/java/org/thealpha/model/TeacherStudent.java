package org.thealpha.model;

import java.util.List;

public class TeacherStudent {
    private Scholar nowscholar;
    private Scholar teacher;
    private List<Scholar> students;
    private List<Scholar> classmate;

    public void setNowscholar(Scholar nowscholar) {
        this.nowscholar = nowscholar;
    }

    public Scholar getNowscholar() { return nowscholar; }

    public void setTeacher(Scholar teacher){ this.teacher = teacher; }

    public Scholar getTeacher() { return teacher; }

    public void setStudents(List<Scholar> students) {
        this.students = students;
    }

    public List<Scholar> getStudents() {
        return students;
    }

    public void setClassmate(List<Scholar> classmate) {
        this.classmate = classmate;
    }

    public List<Scholar> getClassmate() {
        return classmate;
    }


}
