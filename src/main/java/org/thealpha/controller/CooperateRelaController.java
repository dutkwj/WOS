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
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CooperateRelaController {

    @Autowired
    private HbaseTemplate hbaseTemplate;

    @RequestMapping("/cooperateRela")
    public String helloWorld(Model model) {
        System.out.println("hbaseTemplate");
        System.out.println(hbaseTemplate);
        String result = hbaseTemplate.get("testTable3", "r3", new RowMapper<String>() {
            public String mapRow(org.apache.hadoop.hbase.client.Result result, int i) throws Exception {
                return Bytes.toString(result.getValue("cf3".getBytes(), "q3".getBytes()));
            }
        });
        System.out.println(result); // 输出结果是：value3


        return "cooperateRela.ftl";
    }
}
