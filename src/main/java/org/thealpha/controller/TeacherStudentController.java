package org.thealpha.controller;


import com.google.gson.Gson;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.thealpha.model.*;
import org.thealpha.service.RankService;
import org.thealpha.service.ScholarInfoService;
import org.thealpha.service.TeacherStudentService;
import org.springframework.web.bind.annotation.PathVariable;
import java.util.List;
import java.util.ArrayList;

@Controller
public class TeacherStudentController {
    @Autowired
    private TeacherStudentService teacherStudentService;
    @Autowired
    private RankService rankService;
    @Autowired
    private ScholarInfoService scholarInfoService;
    @RequestMapping("/Advisor-advisee/{scholarId}/tea_stu_main")
    public String Tea_stu_main(@PathVariable String scholarId, Model model) {
        List<Scholar> top100Scholars = rankService.getTop100Students();
        model.addAttribute("scholars", top100Scholars);
        return "tea_stu_main";
    }
    @RequestMapping("/Advisor-advisee/{scholarId}/influence")
   // @RequestMapping("/influence")
    public String Influence( String scholarId, Model model) {
        return "influence";
    }

    @RequestMapping("/Advisor-advisee/{scholarId}/tree")
    public String Tree( @PathVariable String scholarId, Model model) {
        //真实数据
        /*Scholar teacher = teacherStudentService.getTeacherByStudentId(scholarId);//当前学者的老师

        List<Scholar> tea_stu = teacherStudentService.getStudentsByTeacherId(teacher.getIndex());//当前学者的老师的学生  考虑当前学者无老师的情况
        List<Scholar> stu = teacherStudentService.getStudentsByTeacherId(scholarId);//当前学者的学生  考虑当前学者无学生的情况
        List<Cooperater> cooperatersList = new ArrayList<Cooperater>();
        List<Evalue> evalueList = new ArrayList<Evalue>();
        boolean del = false;
        Scholar delcooperate = null;
        List<Cooperater> co = teacherStudentService.getCooperaterById(scholarId);//当前学者的合作者
        for (int k = 0; k < stu.size(); k++) {
            Cooperater cooperate = new Cooperater();
            if (CollectionUtils.isNotEmpty(stu) && teacher != null)
                for (Scholar stus : stu) {
                    if (stus.getIndex().equals(teacher.getIndex())) {
                        del = true;
                        delcooperate = stus;
                    }
                }
            if (del) {
                stu.remove(delcooperate);
            }//在所有合作者中找到当前学生
            cooperate.setName(stu.get(k).getName());
            for (int f = 0; f < co.size(); f++) {
                if (co.get(f).getName().equals(stu.get(k).getName())) {
                    cooperate.setCount(co.get(f).getCount());
                }
            }
            cooperatersList.add(cooperate);
        }
        //宗谱图
        boolean remove = false;
        Scholar removedScholar = null;
        List delList = new ArrayList();
        List delList1 = new ArrayList();
        List<Student> studentList = new ArrayList<Student>();
        List<Teacher> teacherList = new ArrayList<Teacher>();
        for (int i = 0; i < tea_stu.size(); i++) {
            studentList = new ArrayList<Student>();
            Teacher teachers = new Teacher();
            teachers.setName(tea_stu.get(i).getName());
            List<Scholar> students = teacherStudentService.getStudentsByTeacherId(tea_stu.get(i).getIndex());//当前学者的老师的学生的学生
            if (CollectionUtils.isNotEmpty(students) && teacher != null)
                for (Scholar scholar : students) {
                    if (scholar.getIndex().equals(teacher.getIndex())) {
                        delList1.add(scholar);
                    }
                }
            students.removeAll(delList1);

            if (CollectionUtils.isNotEmpty(students))
                for (Scholar scholar : students) {
                    for (int ii = 0; ii < tea_stu.size(); ii++) {
                        if (scholar.getName().equals(tea_stu.get(ii).getName())) {
                            delList.add(scholar);
                        }
                    }
                }
            students.removeAll(delList);

            *//*if (remove) {
                students.remove(removedScholar);
            }*//*
            for (int j = 0; j < students.size(); j++) {
                Student student = new Student();
                student.setName(students.get(j).getName());
                //student.setValue(1224);
                studentList.add(student);
            }
            teachers.setChildren(studentList);
            teacherList.add(teachers);
        }
        TeacherWarp teacherWarp = new TeacherWarp();
        teacherWarp.setName(teacher.getName());
        teacherWarp.setChildren(teacherList);

        //System.out.println(123);
        Gson gson = new Gson();
        //System.out.print(0);
        String tea_stu_json = gson.toJson(teacherWarp);
        System.out.println(tea_stu_json);
        model.addAttribute("tea_stu_tree", tea_stu_json);*/
        return "tree";
    }


    @RequestMapping("/Advisor-advisee/{scholarId}/graph")
    public String Co_graph(@PathVariable String scholarId, Model model) {
       // System.out.print(0);
        //真实数据
/*        Scholar teacher = teacherStudentService.getTeacherByStudentId(scholarId);//当前学者的老师
        List<Scholar> tea_stu = teacherStudentService.getStudentsByTeacherId(teacher.getIndex());//当前学者的老师的学生  考虑当前学者无老师的情况
        List<Scholar> stu = teacherStudentService.getStudentsByTeacherId(scholarId);//当前学者的学生  考虑当前学者无学生的情况
        List<Cooperater> cooperatersList = new ArrayList<Cooperater>();
        List<Evalue> evalueList = new ArrayList<Evalue>();
        boolean del = false;
        Scholar delcooperate = null;
        List<Cooperater> co = teacherStudentService.getCooperaterById(scholarId);//当前学者的合作者
        for (int k = 0; k < stu.size(); k++) {
            Cooperater cooperate = new Cooperater();
            if (CollectionUtils.isNotEmpty(stu) && teacher != null)
                for (Scholar stus : stu) {
                    if (stus.getIndex().equals(teacher.getIndex())) {
                        del = true;
                        delcooperate = stus;
                    }
                }
            if (del) {
                stu.remove(delcooperate);
            }//在所有合作者中找到当前学生
            cooperate.setName(stu.get(k).getName());
            for (int f = 0; f < co.size(); f++) {
                if (co.get(f).getName().equals(stu.get(k).getName())) {
                    cooperate.setCount(co.get(f).getCount());
                }
            }
            cooperatersList.add(cooperate);
        }
        //合作图
        List<Nodes_new> NodeList = new ArrayList<Nodes_new>();
        List<Links_new> LinkList = new ArrayList<Links_new>();
        List<Categories> CategoriesList = new ArrayList<Categories>();
        List<Nodes_new_ID> IdList = new ArrayList<Nodes_new_ID>();
        List delnodeList = new ArrayList();
        List delnodeList1 = new ArrayList();
        Nodes_new nodes = new Nodes_new();
        Links_new links = new Links_new();
        Nodes_new_ID ids = new Nodes_new_ID();
        Categories categories = new Categories();
        nodes.setName(teacher.getName());
        nodes.setSymbolSize(20);
        nodes.setCategory(teacher.getName());
        nodes.setDraggable("true");
        NodeList.add(nodes);
        categories.setName(teacher.getName());
        CategoriesList.add(categories);
        ids.setID(teacher.getIndex());
        ids.setName(teacher.getName());
        IdList.add(ids);
        for (int i = 0; i < tea_stu.size(); i++) {
            nodes = new Nodes_new();
            categories = new Categories();
            ids = new Nodes_new_ID();
            List<Scholar> students = teacherStudentService.getStudentsByTeacherId(tea_stu.get(i).getIndex());//当前学者的老师的学生的学生
            if (CollectionUtils.isNotEmpty(students) && teacher != null)
                for (Scholar scholar : students) {
                    if (scholar.getIndex().equals(teacher.getIndex())) {
                        delnodeList.add(scholar);
                    }
                }
            students.removeAll(delnodeList);
            if (CollectionUtils.isNotEmpty(students))
                for (Scholar scholar : students) {
                    for (int ii = i + 1; ii < tea_stu.size(); ii++) {
                        if (scholar.getIndex().equals(tea_stu.get(ii).getIndex())) {
                            delnodeList1.add(scholar);
                        }
                    }
                }
            students.removeAll(delnodeList1);
            nodes.setName(tea_stu.get(i).getName());
            nodes.setSymbolSize(15);
            nodes.setCategory(tea_stu.get(i).getName());
            nodes.setDraggable("true");
            NodeList.add(nodes);
            categories.setName(tea_stu.get(i).getName());
            CategoriesList.add(categories);
            ids.setID(tea_stu.get(i).getIndex());
            ids.setName(tea_stu.get(i).getName());
            IdList.add(ids);
            for (int j = 0; j < students.size(); j++) {
                nodes = new Nodes_new();
                ids = new Nodes_new_ID();
                nodes.setName(students.get(j).getName());
                nodes.setSymbolSize(10);
                nodes.setCategory(tea_stu.get(i).getName());
                nodes.setDraggable("true");
                NodeList.add(nodes);
                ids.setID(students.get(j).getIndex());
                ids.setName(students.get(j).getName());
                IdList.add(ids);
            }
        }
        for (int i = 0; i < IdList.size(); i++) {
            List<Cooperater> co_count = teacherStudentService.getCooperaterById(IdList.get(i).getID());//所有节点的合作者
            List<String> co_count_arr = new ArrayList<String>();
            for (int coo = 0; coo < co_count.size(); coo++) {
                co_count_arr.add(co_count.get(coo).getIndex());
            }
            for (int j = i + 1; j < IdList.size(); j++) {
                links = new Links_new();
                if (co_count_arr.contains(IdList.get(j).getID())) {
                    links.setSource(IdList.get(i).getName());
                    links.setTarget(IdList.get(j).getName());
                    LinkList.add(links);
                }
            }
        }

        for (int ii = 0; ii < NodeList.size(); ii++) {
            for (int ij = NodeList.size() - 1; ij > ii; ij--) {
                if (NodeList.get(ij).getName().equals(NodeList.get(ii).getName())) {
                    NodeList.remove(ij);
                }
            }
        }
        Nodes_Links_new nodes_links = new Nodes_Links_new();
        nodes_links.setData(NodeList);
        nodes_links.setLinks(LinkList);
        nodes_links.setCategories(CategoriesList);
        Gson gson = new Gson();
        String nodes_links_json = gson.toJson(nodes_links);
        System.out.println(nodes_links_json);
        model.addAttribute("tea_stu_graph", nodes_links_json);*/
        return "graph";
    }


    @RequestMapping("/Advisor-advisee/{scholarId}/evalue")
    public String Radar(@PathVariable String scholarId, Model model) {

        Scholar teacher = teacherStudentService.getTeacherByStudentId(scholarId);//当前学者的老师
        List<Scholar> stu = teacherStudentService.getStudentsByTeacherId(scholarId);//当前学者的学生  考虑当前学者无学生的情况
        List<Cooperater> co = teacherStudentService.getCooperaterById(scholarId);//当前学者的合作者
        List<Cooperater> cooperatersList = new ArrayList<Cooperater>();
        List<Evalue> evalueList = new ArrayList<Evalue>();
        boolean del = false;
        Scholar delcooperate = null;
        if (CollectionUtils.isNotEmpty(stu) && teacher != null) {
            for (Scholar stus : stu) {
                if (stus.getIndex().equals(teacher.getIndex())) {
                    del = true;
                    delcooperate = stus;
                }
            }
            if (del) {
                stu.remove(delcooperate);
            }
        }
        for (int k = 0; k < stu.size(); k++) {
            Cooperater cooperate = new Cooperater();
            //在所有合作者中找到当前学生
            //雷达图
            cooperate.setName(stu.get(k).getName());
            //System.out.println(co.size());
            for (int f = 0; f < co.size(); f++) {
                if (co.get(f).getName().equals(stu.get(k).getName())) {
                    cooperate.setCount(co.get(f).getCount());
                }
            }
            cooperatersList.add(cooperate);
            /*for(int ii=0;ii<cooperatersList1.size();ii++){
                System.out.println(cooperatersList1.get(ii).getName());
            }*/

        }
        int[] a = {8, 10, 5, 16, 11, 8, 6, 12, 10, 35, 6, 8, 13, 9, 15, 14, 20, 11, 13, 10, 8, 18, 9, 15, 16, 5, 21, 19};

        for (int h = 0; h < stu.size(); h++) {
            Evalue evalue = new Evalue();
            evalue.setName(stu.get(h).getName());
            evalue.setHindex(stu.get(h).getHindex());
            evalue.setCocount(cooperatersList.get(h).getCount());
            evalue.setRefednum(stu.get(h).getRefedNumber());
            //System.out.println(stu.get(h).getName());
            //System.out.println(stu.get(h).getRefedNumber());
            evalue.setPapernum(a[h]);
            evalueList.add(evalue);

        }
//        for(int i=0;i<evalueList.size();i++){
//            System.out.println(evalueList.get(i).getRefednum());
//        }
//        for(int ii=0;ii<evalueList.size();ii++){
//            System.out.println(evalueList.get(ii).getName());
//        }
        model.addAttribute("cooperate", cooperatersList);
        model.addAttribute("evalue", evalueList);
        return "evalue";
    }
}