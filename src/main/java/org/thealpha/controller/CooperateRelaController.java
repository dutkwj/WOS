package org.thealpha.controller;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.data.hadoop.hbase.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.thealpha.model.Cooperater;
import org.thealpha.model.Scholar;
import org.thealpha.model.YearCount;
import org.thealpha.service.ScholarCooperateService;
import org.thealpha.service.ScholarInfoService;

import java.util.List;


@Controller
public class CooperateRelaController {

    @Autowired
    private ScholarCooperateService scholarCooperateService;

    @Autowired
    private ScholarInfoService scholarInfoService;

    @RequestMapping("/cooperateRela/{scholarId}/count")
    public String helloWorld(@PathVariable String scholarId, Model model) {
        List<Cooperater> cooperaters = scholarCooperateService.getCooperaterById(scholarId);
        Scholar scholar = scholarInfoService.getScholarById(scholarId);

        List<YearCount> yearCounts = scholarCooperateService.getCooperateYearCountsById(scholarId);
        model.addAttribute("cooperaters", cooperaters);
        model.addAttribute("middleScholar", scholar);
        model.addAttribute("yearCounts", yearCounts);
        return "cooperateRela.ftl";
    }
}
