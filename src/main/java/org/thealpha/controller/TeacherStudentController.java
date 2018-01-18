package org.thealpha.controller;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.thealpha.model.Scholar;
import org.thealpha.service.ScholarInfoService;
import org.thealpha.service.TeacherStudentService;

import java.util.List;

@Controller
public class TeacherStudentController {

    @Autowired
    private TeacherStudentService teacherStudentService;

    @Autowired
    private ScholarInfoService scholarInfoService;

    @RequestMapping("/teacherStudent/{scholarId}")
    public String index(@PathVariable String scholarId, Model model) {
        List<Scholar> students = teacherStudentService.getStudentsByTeacherId(scholarId);
        Scholar teacher = teacherStudentService.getTeacherByStudentId(scholarId);
        boolean remove = false;
        Scholar removedScholar = null;
        if (CollectionUtils.isNotEmpty(students) && teacher != null)
        for (Scholar scholar : students) {
            if (scholar.getIndex().equals(teacher.getIndex())) {
                remove = true;
                removedScholar = scholar;
            }
        }
        if (remove) {
            students.remove(removedScholar);
        }

        Scholar scholar = scholarInfoService.getScholarById(scholarId);
        model.addAttribute("students", students);
        model.addAttribute("teacher", teacher);
        model.addAttribute("middleScholar", scholar);
        return "TeaStuRela";
    }
}