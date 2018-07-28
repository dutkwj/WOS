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
import org.thealpha.service.ReferenceService;
import org.thealpha.service.ScholarInfoService;
import org.thealpha.service.TeacherStudentService;
import org.springframework.web.bind.annotation.PathVariable;

import javax.swing.*;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.ArrayList;

@Controller
public class TeacherStudentController {
    @Autowired
    private TeacherStudentService teacherStudentService;
    @Autowired
    private ScholarInfoService scholarInfoService;
    @Autowired
    private ReferenceService referenceService;
    TeacherWarp teacherWarp = new TeacherWarp();
    //寻找某一学者学生的方法
    public List<Scholar> students(String scholarId) {
        List<Scholar> student = teacherStudentService.getStudentsByTeacherId(scholarId);
        return student;
    }

    //寻找某一学者老师的方法
    public Scholar teacher(String scholarId) {
        Scholar teacher = teacherStudentService.getTeacherByStudentId(scholarId);
        return teacher;
    }

    //师生宗谱关系
    @RequestMapping("/Advisor-advisee/{scholarId}/tree")
    public String Tree(@PathVariable String scholarId, Model model){
        model.addAttribute("scholarId", scholarId);
        return "student_tree";
    }
    @RequestMapping("/JSON/{scholarId}")
    @ResponseBody()
    public List<List<TeacherStudent>> JSONTree(@PathVariable String scholarId, Model model) {
        //当前学者在第0层，他的老师从上到下依次为03,02,01，他的学生依次为1,2,3

        List<List<TeacherStudent>> all=new ArrayList<>();//存放所有学者
        List<Scholar> stu_01 = students(scholarId); //当前学者的学生,即01层学生
        TeacherStudent middlescholar = new TeacherStudent();
//        String userName = teacher(stu_01.get(0).getIndex()).getName();
        Scholar aa = scholarInfoService.getScholarById(scholarId);//当前学者信息
//        List<String> visited = new ArrayList<>();
//        //实例化Scholar对象
//        aa.setIndex(scholarId);
//        aa.setName(userName);
        middlescholar.setNowscholar(aa);
//        visited.add(aa.getIndex());
        //以下为寻找老师的代码
//        List<Scholar> t = new LinkedList<>();
        Scholar t_01=teacher(scholarId);//当前学者的老师，即01层老师
        if(t_01!=null/*&&!isited.contains(t_01.getIndex())*/){//当前学者的老师存在且未加入all
//            aa=new Scholar();
//            aa.setIndex(t_01.getIndex());
//            aa.setName(t_01.getName());
              List<Scholar> classmate = students(t_01.getIndex());
              middlescholar.setClassmate(classmate);
              middlescholar.setTeacher(t_01);//加入01层老师
        }
//        Scholar t_02=teacher(t_01.getIndex());//01层老师的老师，即02层老师
//        if(t_02!=null&&!all.contains(t_02.getIndex())){//02层老师存在且未加入all
//            //实例化Scholar对象
//            aa=new Scholar();
//            aa.setIndex(t_02.getIndex());
//            aa.setName(t_02.getName());
//            all.add(t_02.getIndex());//加入02层老师
//        }
//
//        Scholar t_03=teacher(t_02.getIndex());//02层老师的老师，即03层老师
//        if(t_03!=null&&!all.contains(t_03.getIndex())){//03层老师存在且未加入all
//            if(t_03.getIndex().equals(t_01.getIndex())){//判断是否存在02层老师的老师（03层老师）同时也是他的学生的情况，如果有，移除02层老师
//                all.remove(t_02.getIndex());
//                t_02=null;
//                t_03=null;
//            }
//            else{//如果没有。正常实例化，03层老师加入all
//                aa=new Scholar();
//                aa.setIndex(t_03.getIndex());
//                aa.setName(t_03.getName());
//                all.add(t_03.getIndex());
//            }
//        }

        if(t_01!=null){//如果01层老师找到
             for(int i=0;i<stu_01.size();i++){//判断是否存在当前学者的学生同时也是他的老师的情况，如果有，移除这个学生
                if(stu_01.get(i).getName().equals(t_01.getName())){
                    stu_01.remove(stu_01.get(i));
                }
//                else if(all.contains(stu_01.get(i).getIndex())){
//                    stu_01.remove(stu_01.get(i));
//                }
            }
        }
        middlescholar.setStudents(stu_01);
        List<TeacherStudent> stu01list = new ArrayList<>();
        stu01list.add(middlescholar);
//        System.out.println(middlescholar.getClassmate());
//        System.out.println(middlescholar.getStudents());

        List<TeacherStudent> stu02list = new ArrayList<>();
        if (stu_01 != null) {
            List<Scholar> stu_02 = new ArrayList<>();
            for(int i = 0; i < stu_01.size(); i++){
                Scholar thismiddle = stu_01.get(i);
                stu_02 = students(thismiddle.getIndex());
//                visited02.add(teacherStudentService.getStudenIdsByTeacherId(thismiddle.getIndex()));
                TeacherStudent ts = new TeacherStudent();
                ts.setNowscholar(thismiddle);
                ts.setStudents(stu_02);
                stu02list.add(ts);
            }
        }

        List<TeacherStudent> stu03list = new ArrayList<>();
        if(stu02list != null){
            List<Scholar> stu_03 = new ArrayList<>();
            for(int i = 0; i < stu02list.size(); i++){
                List<Scholar> visited02 = stu02list.get(i).getStudents();
                if(visited02 != null) {
                    for (int j = 0; j < visited02.size(); j++) {
                        Scholar thismiddle = visited02.get(j);
                        stu_03 = students(thismiddle.getIndex());
                        TeacherStudent ts = new TeacherStudent();
                        ts.setNowscholar(thismiddle);
                        ts.setStudents(stu_03);
                        stu03list.add(ts);
                    }
                }
            }
        }
        all.add(stu01list);
        all.add(stu02list);
        all.add(stu03list);
        //以下为寻找学生的代码
//        List<TeacherWarp> teacherwarpList = new ArrayList<TeacherWarp>();

//        if (stu_01 != null) {//如果当前学者的学生。即01层学生存在
//            for (int i = 0; i < stu_01.size(); i++) {
//                if(!all.contains(stu_01.get(i).getIndex())){ //all中不含该学生
//                    //实例化对象
//                    aa=new Scholar();
//                    aa.setIndex(stu_01.get(i).getIndex());
//                    aa.setName(stu_01.get(i).getName());
//                    all.add(stu_01.get(i).getIndex());
//                }
//                TeacherWarp teacherWarp = new TeacherWarp();
//                List<Student> studentList = new ArrayList<Student>();
//                List<Teacher> teacherList = new ArrayList<Teacher>();
//
//                List<Scholar> stu_02 = students(stu_01.get(i).getIndex());//02层学生
//                if (stu_02 != null) { //如果02层学生存在
//                    for(int ii=0;ii<stu_02.size();ii++){
//                        if(stu_02.get(ii).getIndex().equals(scholarId)){ //判断02层学生是否同时为01层学生的老师，如果是，将其移除
//                            stu_02.remove(stu_02.get(ii));
//                        }
//                        else if(all.contains(stu_02.get(ii).getIndex())){//判断all中是否有02层学生
//                            stu_02.remove(stu_02.get(ii));
//                        }
//                    }
//                    for (int j = 0; j < stu_02.size(); j++) {
//                        if(!all.contains(stu_02.get(j).getIndex())){
//                            aa=new Scholar();
//                            aa.setIndex(stu_02.get(j).getIndex());
//                            aa.setName(stu_02.get(j).getName());
//                            all.add(stu_02.get(j).getIndex());
//                        }
//                        studentList = new ArrayList<Student>();
//                        Teacher teachers = new Teacher();
//                        teachers.setName(stu_02.get(j).getName());//02层学生作为老师
//
//                        List<Scholar> stu_03 = students(stu_02.get(j).getIndex());//03层学生
//                        if (stu_03 != null) {
//                            for(int ii=0;ii<stu_03.size();ii++){
//                                if(stu_03.get(ii).getIndex().equals(stu_01.get(i).getIndex())){
//                                    stu_03.remove(stu_03.get(ii));
//                                }
//                                else if(all.contains(stu_03.get(ii).getIndex())){
//                                    stu_03.remove(stu_03.get(ii));
//                                }
//                            }
//                            for (int k = 0; k < stu_03.size(); k++) {
//                                if(!all.contains(stu_03.get(k).getIndex())){
//                                    aa=new Scholar();
//                                    aa.setIndex(stu_03.get(k).getIndex());
//                                    aa.setName(stu_03.get(k).getName());
//                                    all.add(stu_03.get(k).getIndex());
//                                }
//                                Student student = new Student();
//                                student.setName(stu_03.get(k).getName());
//                                studentList.add(student);
//                            }
//                            //03层学生和02层学生建立师生关系
//                            teachers.setChildren(studentList);//03层学生作为02层学生的学生
//                            teacherList.add(teachers);
//
//                        } else {
//                            //System.out.println("list3 is null");
//                        }
//
//                    }
//
//                } else {
//                    //System.out.println("list2 is null");
//                }
//                //01层学生和02层学生建立师生关系
//                teacherWarp.setName(stu_01.get(i).getName());//01层学生作为老师
//                teacherWarp.setChildren(teacherList);//02层学生作为01层学生的学生
//                teacherwarpList.add(teacherWarp);
//            }
//        } else {
//            //System.out.println("list1 is null");
//        }
        //当前学者与01层学生建立师生关系
//        Teacher_0 teacher_0 = new Teacher_0();
//        teacher_0.setName(userName);
//        teacher_0.setChildren(teacherwarpList);
//
//        List<Teacher_0> teacher_0_List = new ArrayList<Teacher_0>();
//        teacher_0_List.add(teacher_0);
//
//        Teacher_1 teacher_1 = new Teacher_1();
//        List<Teacher_1> teacher_1_List = new ArrayList<Teacher_1>();
//        Teacher_2 teacher_2 = new Teacher_2();
//        List<Teacher_2> teacher_2_List = new ArrayList<Teacher_2>();
//
//        if(t_01!=null){//如果01层老师存在
//            List<Scholar> stu01 = students(t_01.getIndex());//01层老师的学生，含当前学者及其同门
//            if(t_02!=null){
//                for(int g=0;g<stu01.size();g++){
//                    if(stu01.get(g).getIndex().equals(t_02.getIndex())){//判断是否存在01层老师的学生同时也为他的老师的情况，若有，移除该学生
//                        stu01.remove(stu01.get(g));
//                    }
//                }
//            }
//            for (int g = 0; g < stu01.size(); g++) {
//                teacher_0 = new Teacher_0();
//                if (!stu01.get(g).getIndex().equals(scholarId) ) {//把除去当前学者的0层老师的其他学生加入
//                    //建立当前学者所在层其他学生的师生关系
//                    teacher_0.setName(stu01.get(g).getName());
//                    teacher_0.setChildren(null);//不再寻找其他学生的学生
//                    teacher_0_List.add(teacher_0);
//                }
//            }
//            //建立01层老师和当前学者所在层学生的师生关系
//            teacher_1.setName(t_01.getName());
//            teacher_1.setChildren(teacher_0_List);
//            teacher_1_List.add(teacher_1);
//        }
//        else{//如果01层老师不存在
//            Gson gson = new Gson();
//            String tea_stu_json = gson.toJson(teacher_0_List);
//            System.out.println(tea_stu_json);
//            System.out.println("finish01");
//            model.addAttribute("tea_stu_tree", tea_stu_json);
//            return "tree";
//        }
//
//        if(t_02!=null){//如果02层老师存在
//            List<Scholar> stu02 = students(t_02.getIndex());//02层老师的所有学生，其中包含01层老师及其同门
//            if(t_03!=null){//如果03层老师存在
//                for(int g=0;g<stu02.size();g++){
//                    if(stu02.get(g).getIndex().equals(t_03.getIndex())){
//                        stu02.remove(stu02.get(g));
//                    }
//                }
//            }
//            for (int g = 0; g < stu02.size(); g++) {
//                teacher_1 = new Teacher_1();
//                if (!stu02.get(g).getIndex().equals(t_01.getIndex()) ) {//把除01层老师之外的学生加入
//                    //建立除01层老师之外的其他学生的师生关系
//                    teacher_1.setName(stu02.get(g).getName());
//                    teacher_1.setChildren(null);//不再寻找其他该层其他学生的学生
//                    teacher_1_List.add(teacher_1);
//                }
//            }
//            //建立02层老师01层老师所在层的学生的师生关系
//            teacher_2.setName(t_02.getName());
//            teacher_2.setChildren(teacher_1_List);
//            teacher_2_List.add(teacher_2);
//        }
//        else{
//            Gson gson = new Gson();
//            String tea_stu_json = gson.toJson(teacher_1_List);
//            System.out.println(tea_stu_json);
//            System.out.println("finish02");
//            model.addAttribute("tea_stu_tree", tea_stu_json);
//            return "tree";
//        }
//
//        if(t_03!=null){//03层老师
//            List<Scholar> stu03 = students(t_03.getIndex());//03层老师的所有学生，含02层老师及其同门
//            for (int g = 0; g < stu03.size(); g++) {
//                teacher_2 = new Teacher_2();
//                if (!stu03.get(g).getIndex().equals(t_02.getIndex())) {//把除02层老师之外的学生加入
//                    //建立除02层老师之外的其他学生的师生关系
//                    teacher_2.setName(stu03.get(g).getName());
//                    teacher_2.setChildren(null);
//                    teacher_2_List.add(teacher_2);
//                }
//            }
//            //建立03层老师02层老师所在层的学生的师生关系
//            Teacher_3 teacher_3 = new Teacher_3();
//            teacher_3.setName(t_03.getName());
//            teacher_3.setChildren(teacher_2_List);
//            Gson gson = new Gson();
//            String tea_stu_json = gson.toJson(teacher_3);
//            System.out.println(tea_stu_json);
//            System.out.println("finish03");
//            model.addAttribute("tea_stu_tree", tea_stu_json);
//            return "tree";
//
//        }else{
//            Gson gson = new Gson();
//            //将list转换为json格式
//            String tea_stu_json = gson.toJson(teacher_2_List);
//            System.out.println(tea_stu_json);
//            System.out.println("finish04");
//            //将json格式的字符串传到前台
//            model.addAttribute("tea_stu_tree", tea_stu_json);
//            //传到对应ftl文件：tree.ftl
            return all;
    }

    //师生合作关系
//    @RequestMapping("/Advisor-advisee/{scholarId}/graph")
    public String Co_graph(@PathVariable String scholarId, Model model) {
        //与上述师生宗谱关系代码基本相同，不同点是定义了AllScholar,用来存放实体类对象aa
        List<String> all=new ArrayList<String>();
        List<Scholar> AllScholar=new ArrayList<Scholar>();
        List<Scholar> stu_01 = students(scholarId); //当前学者的学生
        String userName = teacher(stu_01.get(0).getIndex()).getName();
        Scholar aa=new Scholar();
        aa.setIndex(scholarId);
        aa.setName(userName);
        AllScholar.add(aa);
        all.add(scholarId);
        Scholar t_01=teacher(scholarId);//当前学者的老师
        if(t_01!=null&&!all.contains(t_01.getIndex())){
            aa=new Scholar();
            aa.setIndex(t_01.getIndex());
            aa.setName(t_01.getName());
            AllScholar.add(aa);
            all.add(t_01.getIndex());
        }
        Scholar t_02=teacher(t_01.getIndex());
        if(t_02!=null&&!all.contains(t_02.getIndex())){
            aa=new Scholar();
            aa.setIndex(t_02.getIndex());
            aa.setName(t_02.getName());
            AllScholar.add(aa);
            all.add(t_02.getIndex());
        }
        Scholar t_03=teacher(t_02.getIndex());
        if(t_03!=null){
            if(t_03.getIndex().equals(t_01.getIndex())){
                AllScholar.remove(t_02);
                all.remove(t_02.getIndex());
            }
            else{
                aa=new Scholar();
                aa.setIndex(t_03.getIndex());
                aa.setName(t_03.getName());
                AllScholar.add(aa);
                all.add(t_03.getIndex());
            }
        }
        if(t_01!=null){//如果老师找到
            for(int i=0;i<stu_01.size();i++){//判断是否存在当前学者的学生同时也是他的老师的情况，如果有，移除这个学生
                if(stu_01.get(i).getName().equals(t_01.getName())){
                    stu_01.remove(stu_01.get(i));
                }
                else if(all.contains(stu_01.get(i).getIndex())){
                    stu_01.remove(stu_01.get(i));
                }
            }
        }
        if (stu_01 != null) {
            for (int i = 0; i < stu_01.size(); i++) {
                if(!all.contains(stu_01.get(i).getIndex())){
                    aa=new Scholar();
                    aa.setIndex(stu_01.get(i).getIndex());
                    aa.setName(stu_01.get(i).getName());
                    AllScholar.add(aa);
                    all.add(stu_01.get(i).getIndex());
                }
                List<Scholar> stu_02 = students(stu_01.get(i).getIndex());//02层学生
                if (stu_02 != null) {
                    for(int ii=0;ii<stu_02.size();ii++){
                        if(stu_02.get(ii).getIndex().equals(scholarId)){
                            stu_02.remove(stu_02.get(ii));
                        }
                        else if(all.contains(stu_02.get(ii).getIndex())){
                            stu_02.remove(stu_02.get(ii));
                        }
                    }//当前学者的学生和他有无重复
                    for (int j = 0; j < stu_02.size(); j++) {
                        if(!all.contains(stu_02.get(j).getIndex())){
                            aa=new Scholar();
                            aa.setIndex(stu_02.get(j).getIndex());
                            aa.setName(stu_02.get(j).getName());
                            AllScholar.add(aa);
                            all.add(stu_02.get(j).getIndex());
                        }
                        List<Scholar> stu_03 = students(stu_02.get(j).getIndex());
                        if (stu_03 != null) {
                            for(int ii=0;ii<stu_03.size();ii++){
                                if(stu_03.get(ii).getIndex().equals(stu_01.get(i).getIndex())){
                                    stu_03.remove(stu_03.get(ii));
                                }
                                else if(all.contains(stu_03.get(ii).getIndex())){
                                    stu_03.remove(stu_03.get(ii));
                                }
                            }
                            for (int k = 0; k < stu_03.size(); k++) {
                                if(!all.contains(stu_03.get(k).getIndex())){
                                    aa=new Scholar();
                                    aa.setIndex(stu_03.get(k).getIndex());
                                    aa.setName(stu_03.get(k).getName());
                                    AllScholar.add(aa);
                                    all.add(stu_03.get(k).getIndex());
                                }
                            }

                        } else {
                            //System.out.println("list3 is null");
                        }

                    }

                } else {
                    //System.out.println("list2 is null");
                }
            }
        } else {
            //System.out.println("list1 is null");
        }
        List<Nodes_new> NodeList = new ArrayList<Nodes_new>();
        List<Links_new> LinkList = new ArrayList<Links_new>();
        List<Categories> CategoriesList = new ArrayList<Categories>();
        List<Nodes_new_ID> IdList = new ArrayList<Nodes_new_ID>();
        Categories categories = new Categories();
        Nodes_new nodes = new Nodes_new();
        Links_new links = new Links_new();
        Nodes_new_ID ids = new Nodes_new_ID();
        List<Cooperater> cooperatersList = new ArrayList<Cooperater>();
        //将所有学者作为节点加入，并设置相关实体类对象属性
        for(int i=0;i<AllScholar.size();i++){
            nodes = new Nodes_new();
            categories = new Categories();
            nodes.setName(AllScholar.get(i).getName());
            nodes.setSymbolSize(20);
            nodes.setCategory(AllScholar.get(i).getName()+i);
            nodes.setDraggable("true");
            NodeList.add(nodes);
            categories.setName(AllScholar.get(i).getName()+i);
            CategoriesList.add(categories);
        }
        for (int i = 0; i < AllScholar.size(); i++) {
            List<Cooperater> co_count = teacherStudentService.getCooperaterById(AllScholar.get(i).getIndex());//所有节点的合作者
            List<String> co_count_arr = new ArrayList<String>();
            for (int coo = 0; coo < co_count.size(); coo++) {
                co_count_arr.add(co_count.get(coo).getIndex());
            }
            //根据找到的学者间的合作关系建立节点间连线
            for (int j = i + 1; j < AllScholar.size(); j++) {
                links = new Links_new();
                if (co_count_arr.contains(AllScholar.get(j).getIndex())) {
                    links.setSource(AllScholar.get(i).getName());
                    links.setTarget(AllScholar.get(j).getName());
                    links.setCoCount(AllScholar.get(j).getCount());
                    LinkList.add(links);
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
        model.addAttribute("tea_stu_graph", nodes_links_json);
        return "graph";
    }

    //师生引用关系
    //基本思路与师生合作关系相同，只是把合作者变成了论文引用者
    @RequestMapping("/Advisor-advisee/{scholarId}/reference")
    public String Ref_graph(@PathVariable String scholarId, Model model) {

        List<String> all=new ArrayList<String>();
        List<Scholar> AllScholar=new ArrayList<Scholar>();
        List<Scholar> stu_01 = students(scholarId); //当前学者的学生
        String userName = teacher(stu_01.get(0).getIndex()).getName();
        Scholar aa=new Scholar();
        aa.setIndex(scholarId);
        aa.setName(userName);
        AllScholar.add(aa);
        all.add(scholarId);
        Scholar t_01=teacher(scholarId);//当前学者的老师

        if(t_01!=null&&!all.contains(t_01.getIndex())){
            aa=new Scholar();
            aa.setIndex(t_01.getIndex());
            aa.setName(t_01.getName());
            AllScholar.add(aa);
            all.add(t_01.getIndex());
        }
        Scholar t_02=teacher(t_01.getIndex());
        if(t_02!=null&&!all.contains(t_02.getIndex())){
            aa=new Scholar();
            aa.setIndex(t_02.getIndex());
            aa.setName(t_02.getName());
            AllScholar.add(aa);
            all.add(t_02.getIndex());
        }
        Scholar t_03=teacher(t_02.getIndex());
        if(t_03!=null){
            if(t_03.getIndex().equals(t_01.getIndex())){
                AllScholar.remove(t_02);
                all.remove(t_02.getIndex());
            }
            else{
                aa=new Scholar();
                aa.setIndex(t_03.getIndex());
                aa.setName(t_03.getName());
                AllScholar.add(aa);
                all.add(t_03.getIndex());
            }
        }
        if(t_01!=null){//如果老师找到
            for(int i=0;i<stu_01.size();i++){//判断是否存在当前学者的学生同时也是他的老师的情况，如果有，移除这个学生
                if(stu_01.get(i).getName().equals(t_01.getName())){
                    stu_01.remove(stu_01.get(i));
                }
                else if(all.contains(stu_01.get(i).getIndex())){
                    stu_01.remove(stu_01.get(i));
                }
            }
        }
        if (stu_01 != null) {
            for (int i = 0; i < stu_01.size(); i++) {
                if(!all.contains(stu_01.get(i).getIndex())){
                    aa=new Scholar();
                    aa.setIndex(stu_01.get(i).getIndex());
                    aa.setName(stu_01.get(i).getName());
                    AllScholar.add(aa);
                    all.add(stu_01.get(i).getIndex());
                }
                List<Scholar> stu_02 = students(stu_01.get(i).getIndex());//2层学生
                if (stu_02 != null) {
                    for(int ii=0;ii<stu_02.size();ii++){
                        if(stu_02.get(ii).getIndex().equals(scholarId)){
                            stu_02.remove(stu_02.get(ii));
                        }
                        else if(all.contains(stu_02.get(ii).getIndex())){
                            stu_02.remove(stu_02.get(ii));
                        }
                    }//当前学者的学生和他有无重复
                    for (int j = 0; j < stu_02.size(); j++) {
                        if(!all.contains(stu_02.get(j).getIndex())){
                            aa=new Scholar();
                            aa.setIndex(stu_02.get(j).getIndex());
                            aa.setName(stu_02.get(j).getName());
                            AllScholar.add(aa);
                            all.add(stu_02.get(j).getIndex());
                        }
                        List<Scholar> stu_03 = students(stu_02.get(j).getIndex());
                        if (stu_03 != null) {
                            for(int ii=0;ii<stu_03.size();ii++){
                                if(stu_03.get(ii).getIndex().equals(stu_01.get(i).getIndex())){
                                    stu_03.remove(stu_03.get(ii));
                                }
                                else if(all.contains(stu_03.get(ii).getIndex())){
                                    stu_03.remove(stu_03.get(ii));
                                }
                            }
                            for (int k = 0; k < stu_03.size(); k++) {
                                if(!all.contains(stu_03.get(k).getIndex())){
                                    aa=new Scholar();
                                    aa.setIndex(stu_03.get(k).getIndex());
                                    aa.setName(stu_03.get(k).getName());
                                    AllScholar.add(aa);
                                    all.add(stu_03.get(k).getIndex());
                                }
                            }

                        } else {
                            //System.out.println("list3 is null");
                        }

                    }

                } else {
                    //System.out.println("list2 is null");
                }
            }
        } else {
            //System.out.println("list1 is null");
        }
        List<Nodes_new> NodeList = new ArrayList<Nodes_new>();
        List<Links_new> LinkList = new ArrayList<Links_new>();
        List<Categories> CategoriesList = new ArrayList<Categories>();
        List<Nodes_new_ID> IdList = new ArrayList<Nodes_new_ID>();
        Categories categories = new Categories();
        Nodes_new nodes = new Nodes_new();
        Links_new links = new Links_new();
        Nodes_new_ID ids = new Nodes_new_ID();
        for(int i=0;i<AllScholar.size();i++){
            nodes = new Nodes_new();
            categories = new Categories();
            nodes.setName(AllScholar.get(i).getName());
            nodes.setSymbolSize(20);
            nodes.setCategory(AllScholar.get(i).getName()+i);
            nodes.setDraggable("true");
            NodeList.add(nodes);
            categories.setName(AllScholar.get(i).getName()+i);
            CategoriesList.add(categories);
        }
        System.out.println(AllScholar.size());
        for (int i = 0; i < AllScholar.size(); i++) {
            List<Scholar> refScholars = referenceService.getRefAuthorsByAuthorId(AllScholar.get(i).getIndex());//寻找引用关系
            if(refScholars!=null){
                List<String> co_count_arr = new ArrayList<String>();
                for (int coo = 0; coo < refScholars.size(); coo++) {
                    co_count_arr.add(refScholars.get(coo).getIndex());
                }
                for (int j = i + 1; j < AllScholar.size(); j++) {
                    links = new Links_new();

                    if (co_count_arr.contains(AllScholar.get(j).getIndex())) {
                        links.setSource(AllScholar.get(i).getName());
                        links.setTarget(AllScholar.get(j).getName());
                        LinkList.add(links);
                    }

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
        model.addAttribute("tea_stu_ref", nodes_links_json);
        return "reference";
    }

    //学生评估对比
    @RequestMapping("/Advisor-advisee/{scholarId}/evalue")
    public String Radar(@PathVariable String scholarId, Model model) {
        Scholar teacher = teacherStudentService.getTeacherByStudentId(scholarId);//当前学者的老师
        List<Scholar> stu = teacherStudentService.getStudentsByTeacherId(scholarId);//当前学者的学生
        List<Cooperater> co = teacherStudentService.getCooperaterById(scholarId);//当前学者的合作者
        List<Cooperater_teastu> cooperatersList = new ArrayList<Cooperater_teastu>();
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

        //导师与学者的合作次数对比
        for (int k = 0; k < stu.size(); k++) {
            Cooperater_teastu cooperate = new Cooperater_teastu();
            //在所有合作者中找到当前学生
            cooperate.setName(stu.get(k).getName());
            for (int f = 0; f < co.size(); f++) {
                if (co.get(f).getName().equals(stu.get(k).getName())) {
                    cooperate.setCount(co.get(f).getCount());
                    cooperatersList.add(cooperate);
                }
            }
        }

        //学生各项指标情况
        for (int h = 0; h < stu.size(); h++) {
            Evalue evalue = new Evalue();
            evalue.setName(stu.get(h).getName());
            evalue.setHindex(stu.get(h).getHindex());
            evalue.setCocount(cooperatersList.get(h).getCount());
            evalue.setRefednum(stu.get(h).getRefedNumber());
            List<String> aa=scholarInfoService.getPaperIdsByAuthorId(stu.get(h).getIndex());//获取学者发表的所有论文ID
            evalue.setPapernum(aa.size());
            evalueList.add(evalue);

        }
        Gson gson = new Gson();
        String cooperatersList_json = gson.toJson(cooperatersList);
        System.out.println(cooperatersList_json);
        String evalueListjson = gson.toJson(evalueList);
        System.out.println(evalueListjson);
        model.addAttribute("cooperate", cooperatersList_json);
        model.addAttribute("evalue", evalueListjson);
        return "evalue";
    }

    //导师学生数量随年份变化
    @RequestMapping("/Advisor-advisee/{scholarId}/student_number_year")
    public String Student_Number_Year(@PathVariable String scholarId, Model model) {

        Scholar teacher = teacherStudentService.getTeacherByStudentId(scholarId);//当前学者的老师
        List<Scholar> stu = teacherStudentService.getStudentsByTeacherId(scholarId);//当前学者的学生
        List<FirstCoYear> firstCoYear = teacherStudentService.getFirstCooperateYearById(scholarId);//当前学者与其他学者第一次合作的时间

        List<FirstCoYear> firstCoYearList = new ArrayList<FirstCoYear>();
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
        HashMap<Integer,Integer> student_Num_year=new HashMap<Integer, Integer>();
        for (int k = 0; k < stu.size(); k++) {
            FirstCoYear firstCoYears = new FirstCoYear();
            for (int f = 0; f < firstCoYear.size(); f++) {
                if (firstCoYear.get(f).getCooperate().equals(stu.get(k).getIndex())) {//在合作者中找到当前学者的学生
                    firstCoYears.setCooperate(stu.get(k).getName());//合作学者
                    firstCoYears.setYear(firstCoYear.get(f).getYear());//合作年份，作为老师招生年份
                    if(student_Num_year.containsKey(firstCoYear.get(f).getYear())){
                        int count=student_Num_year.get(firstCoYear.get(f).getYear());
                        count+=1;
                        student_Num_year.put(firstCoYear.get(f).getYear(),count);//当年学生数量
                    }
                    else{
                        student_Num_year.put(firstCoYear.get(f).getYear(),1);
                    }
                    firstCoYearList.add(firstCoYears);
                }
            }

        }
        List<FirstCoYearCount> firstCoYearCounts=new ArrayList<FirstCoYearCount>();
        List<Integer> yearRe=new ArrayList<Integer>();
        for(int i=0;i<firstCoYearList.size();i++){
            List<String> ss=new ArrayList<String>();
            int count=0;
            int year=firstCoYearList.get(i).getYear();
            if(!yearRe.contains(year)){
                yearRe.add(year);
                ss.add(firstCoYearList.get(i).getCooperate());
                count++;
                for(int j=i+1;j<firstCoYearList.size();j++){
                    if(year==firstCoYearList.get(j).getYear()){
                        ss.add(firstCoYearList.get(j).getCooperate());
                        count++;
                    }
                }
                FirstCoYearCount firstCoYearCount=new FirstCoYearCount();
                firstCoYearCount.setYear(year);//年份
                firstCoYearCount.setCount(count);//当年学生数量
                firstCoYearCount.setStudents(ss);//当年学生ID
                firstCoYearCounts.add(firstCoYearCount);
            }

        }
        Gson gson = new Gson();
        String student_number_json = gson.toJson(firstCoYearCounts);
        System.out.println(student_number_json);
        model.addAttribute("student_number_year", student_number_json);
        return "student_number_year";
    }
}