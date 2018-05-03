package org.thealpha.controller;

import com.google.gson.Gson;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.thealpha.model.*;
import org.thealpha.service.ScholarInfoService;
import org.thealpha.service.TeacherStudentService;

import java.util.ArrayList;
import java.util.List;
@Controller
@RequestMapping("/network")
public class NetworkController {
    @Autowired

    private TeacherStudentService teacherStudentService;

    @Autowired
    private ScholarInfoService scholarInfoService;
    @RequestMapping("/baseInfo")
    //@RequestMapping("/11/{scholarId}")
  // @RequestMapping("/tea_stu")
    public String index(@PathVariable String scholarId, Model model) {
        Scholar teacher = teacherStudentService.getTeacherByStudentId(scholarId);//当前学者的老师
        //System.out.println(teacher);
        List<Scholar> tea_stu = teacherStudentService.getStudentsByTeacherId(teacher.getIndex());//当前学者的老师的学生  考虑当前学者无老师的情况
        List<Scholar> stu = teacherStudentService.getStudentsByTeacherId(scholarId);//当前学者的学生  考虑当前学者无学生的情况
        List<Cooperater> cooperatersList = new ArrayList<Cooperater>();
        List<Evalue> evalueList = new ArrayList<Evalue>();
        boolean del = false;
        Scholar delcooperate = null;
        List<Cooperater> co = teacherStudentService.getCooperaterById(scholarId);//当前学者的合作者

        for (int k = 0; k < stu.size(); k++) {
            // System.out.println(k);
            //System.out.println(stu.get(k).getName());
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
            // System.out.println("****");
            for (int f = 0; f < co.size(); f++) {
                if (co.get(f).getName().equals(stu.get(k).getName())) {
                    cooperate.setCount(co.get(f).getCount());
                }
            }
            cooperatersList.add(cooperate);
            /*for(int h=0;h<cooperatersList.size();h++){
                System.out.println(cooperatersList.get(h).getName());
                System.out.println(cooperatersList.get(h).getCount());
            }*/

        }
        Evalue evalue = new Evalue();
        for (int h = 0; h < stu.size(); h++) {
            evalue = new Evalue();
            evalue.setName(stu.get(h).getName());
            evalue.setHindex(stu.get(h).getHindex());
            evalue.setCocount(cooperatersList.get(h).getCount());
            evalue.setRefednum(stu.get(h).getRefedNumber());
            evalueList.add(evalue);
        }

        // System.out.print(evalueList.size());
        //System.out.print(evalueList);
        boolean remove = false;
        Scholar removedScholar = null;

        List<Student> studentList = new ArrayList<Student>();

        List<Teacher> teacherList = new ArrayList<Teacher>();
        /*for(int i =0;i<tea_stu.size();i++){
            studentList = new ArrayList<Student>();
            Teacher teachers = new Teacher();
            //System.out.println(tea_stu.get(i).getName());
            teachers.setName(tea_stu.get(i).getName());
            List<Scholar> students = teacherStudentService.getStudentsByTeacherId(tea_stu.get(i).getIndex());//当前学者的老师的学生的学生
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
            for(int j=0;j<students.size();j++){
                Student student = new Student();
                student.setName(students.get(j).getName());
                student.setValue(1224);
                studentList.add(student);
            }
            teachers.setChildren(studentList);
            teacherList.add(teachers);
        }
        TeacherWarp teacherWarp = new TeacherWarp();
        teacherWarp.setName(teacher.getName());
        teacherWarp.setChildren(teacherList);
        Gson gson = new Gson();
        System.out.println(gson.toJson(teacherWarp));
        String tea_stu_json = gson.toJson(teacherWarp);
        //model.addAttribute("tea_stu_tree",tea_stu_json);*/
        /*String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
                "<gexf xmlns=\"http://www.gexf.net/1.2draft\" version=\"1.2\" xmlns:viz=\"http://www.gexf.net/1.2draft/viz\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.gexf.net/1.2draft http://www.gexf.net/1.2draft/gexf.xsd\">\n" +
                "  <meta lastmodifieddate=\"2014-01-30\">\n" +
                "    <creator>Gephi 0.8.1</creator>\n" +
                "    <description></description>\n" +
                "  </meta>\n" +
                "  <graph defaultedgetype=\"undirected\" mode=\"static\">\n" +
                "    <attributes class=\"node\" mode=\"static\">\n" +
                "      <attribute id=\"modularity_class\" title=\"Modularity Class\" type=\"integer\"></attribute>\n" +
                "    </attributes>";
        System.out.print(xml);*/

        List<Nodes> NodeList = new ArrayList<Nodes>();
        List<Links> LinkList = new ArrayList<Links>();
        Nodes nodes = new Nodes();
        Links links = new Links();
        nodes.setId(teacher.getName());
        nodes.setGroup(0);
        NodeList.add(nodes);
        List<Cooperater> co_graph = teacherStudentService.getCooperaterById(teacher.getIndex());//老师的合作者
        List<String> co_graph_arr = new ArrayList<String>();
        for (int coo = 0; coo < co_graph.size(); coo++) {
            co_graph_arr.add(co_graph.get(coo).getIndex());
        }
        for (int i = 0; i < tea_stu.size(); i++) {
            int tea = i + 1;
            int stuStamp = tea ;
            nodes = new Nodes();
            List<Scholar> students = teacherStudentService.getStudentsByTeacherId(tea_stu.get(i).getIndex());//当前学者的老师的学生的学生
            List<Cooperater> co_tea_graph = teacherStudentService.getCooperaterById(tea_stu.get(i).getIndex());//老师的学生的合作者
            List<String> co_tea_graph_arr = new ArrayList<String>();
            for (int co_tea = 0; co_tea < co_tea_graph.size(); co_tea++) {
                co_tea_graph_arr.add(co_tea_graph.get(co_tea).getIndex());
            }
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
                //if(!NodeList.get(y).getId().equals(tea_stu.get(i).getName())){
            nodes.setId(tea_stu.get(i).getName());
            nodes.setGroup(tea);
            NodeList.add(nodes);

            for (int j = 0; j < students.size(); j++) {
                nodes = new Nodes();
                nodes.setId(students.get(j).getName());
                nodes.setGroup(stuStamp);
                NodeList.add(nodes);
                List<Cooperater> co_stu_graph = teacherStudentService.getCooperaterById(students.get(j).getIndex());//老师的学生的学生的合作者
                List<String> co_stu_graph_arr = new ArrayList<String>();
                for (int co_stu = 0; co_stu < co_stu_graph.size(); co_stu++) {
                    co_stu_graph_arr.add(co_stu_graph.get(co_stu).getIndex());
                }
                if (co_graph_arr.contains(students.get(j).getIndex())) {
                    //System.out.println("***");
                    links = new Links();
                    links.setSource(teacher.getName());
                    links.setTarget(students.get(j).getName());
                    links.setValue(10);
                    LinkList.add(links);
                }
                if (co_tea_graph_arr.contains(students.get(j).getIndex())) {
                    //System.out.println("&&&");
                    links = new Links();
                    links.setSource(tea_stu.get(i).getName());
                    links.setTarget(students.get(j).getName());
                    links.setValue(10);
                    LinkList.add(links);
                }
                for (int p = j + 1; p < students.size(); p++) {

                    links = new Links();
                    if (co_stu_graph_arr.contains(students.get(p).getIndex())) {
                        //System.out.println("^^^");
                        links.setSource(students.get(j).getName());
                        links.setTarget(students.get(p).getName());
                        links.setValue(10);
                        LinkList.add(links);
                    }
                }
            }
            links = new Links();
            //在所有老师合作者中找到他的学生
            if (co_graph_arr.contains(tea_stu.get(i).getIndex())) {
                //System.out.println("%%%");
                links = new Links();
                links.setSource(teacher.getName());
                links.setTarget(tea_stu.get(i).getName());
                links.setValue(10);
                LinkList.add(links);
            }
            for (int l = i + 1; l < tea_stu.size(); l++) {
                links = new Links();
                if (co_tea_graph_arr.contains(tea_stu.get(l).getIndex())) {
                    //System.out.println("$$$");
                    links.setSource(tea_stu.get(i).getName());
                    links.setTarget(tea_stu.get(l).getName());
                    links.setValue(10);
                    LinkList.add(links);
                }
            }

        }
        Gson gson = new Gson();
        //System.out.println(gson.toJson(LinkList));
        /*TeacherWarp teacherWarp = new TeacherWarp();
        teacherWarp.setName(teacher.getName());
        teacherWarp.setChildren(teacherList);*/
        Nodes_Links nodes_links = new Nodes_Links();
        for(int ii=0;ii<NodeList.size();ii++){
            for(int ij=NodeList.size()-1;ij>ii;ij--){
                if(NodeList.get(ij).getId().equals(NodeList.get(ii).getId())){
                    NodeList.remove(ij);
                }
            }
        }
        /*Gson gson = new Gson();
        System.out.println(gson.toJson(nodes));
        String tea_stu_json = gson.toJson(nodes);*/
        //model.addAttribute("tea_stu_tree",tea_stu_json);
        String node_json = gson.toJson(NodeList);
        String link_json = gson.toJson(LinkList);
        nodes_links.setNodes(NodeList);
        nodes_links.setLinks(LinkList);
        String nodes_links_json = gson.toJson(nodes_links);
        System.out.println(gson.toJson(nodes_links));
        /*model.addAttribute("nodes",nodes);
        model.addAttribute("links",links);*/
        model.addAttribute("graph", nodes_links_json);
        model.addAttribute("evalue", evalueList);
        model.addAttribute("cooperate", cooperatersList);
        return "11";
    }
}