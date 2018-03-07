import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.*;
import org.apache.hadoop.hbase.*;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.filter.*;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.io.IOUtils;
import org.junit.Test;
import org.junit.runner.Result;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.data.hadoop.hbase.RowMapper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.thealpha.model.Scholar;
import org.thealpha.model.ScholarWeight;
import org.thealpha.model.User;
import org.thealpha.util.ConfigurationConstant;
import org.thealpha.util.HbaseUtils;
import org.thealpha.util.ListTranscoder;
import redis.clients.jedis.JedisCluster;

import java.io.*;
import java.util.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-servlet.xml", "classpath:/redis/spring-redis.xml"})
public class HbaseTest {
    private static final String TABLE_NAME    = "cs_scholar";
    private static final String ROW_KEY       = "r";
    private static final String COLUMN_FAMILY = "info";
    private static final String QUALIFIER     = "name";

    @Autowired
    private HbaseTemplate hbaseTemplate;

    @Autowired
    private JedisCluster jedisCluster;

    @Test
    public void test() {
        // 加载Spring配置文件
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring-servlet.xml");
        // 获取HbaseTemplate
        HbaseTemplate hbaseTemplate = (HbaseTemplate) applicationContext.getBean("hbaseTemplate");
        // 通过表名和rowKey获取最近一行数据
        String result = hbaseTemplate.get(TABLE_NAME, ROW_KEY, new RowMapper<String>() {
            public String mapRow(org.apache.hadoop.hbase.client.Result result, int i) throws Exception {
                return Bytes.toString(result.getValue(COLUMN_FAMILY.getBytes(), QUALIFIER.getBytes()));
            }
        });
        System.out.println(result); // 输出结果是：value1
    }

//    @Test
//    public void titanTest(){
//        BaseConfiguration baseConfiguration = new BaseConfiguration();
//        baseConfiguration.setProperty("storage.backend", "hbase");
//        baseConfiguration.setProperty("storage.hostname", "127.0.0.1");
//        baseConfiguration.setProperty("storage.tablename","titan");
//        baseConfiguration.setProperty("index.search.backend","elasticsearch");
//        baseConfiguration.setProperty("index.search.hostname","127.0.0.1");
//
//        TitanGraph titanGraph = TitanFactory.open(baseConfiguration);
//        GraphTraversalSource g = titanGraph.traversal();
//        Vertex saturn = g.V().has("name", "saturn").next();
//        System.out.print(saturn);
//    }

    @Test
    public void importCooperateScholarTest() {
//        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring-servlet.xml");
//        HbaseTemplate hbaseTemplate = (HbaseTemplate) applicationContext.getBean("hbaseTemplate");
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_author_co_author_count_list.csv");  // CSV文件路径
        BufferedReader br = null;
        try
        {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        // 787016   4CDAA40  1514846 9CE917C
        try {
            while ((line = br.readLine()) != null)  //读取到的内容给line变量
            {
                count += 1;
//                if (count <= 1514846) {
//                    System.out.println(count);
//                    continue;
//                }
                line.substring(0, line.indexOf(","));
                String authorId = line.substring(0, line.indexOf(","));
                String cooperateAuthors = line.substring(line.indexOf(",") + 1);
                cooperateAuthors = cooperateAuthors.replaceAll("\"|\\[|\\]|'", "");
                hbaseTemplate.put(TABLE_NAME, authorId, COLUMN_FAMILY, QUALIFIER, cooperateAuthors.getBytes());

                System.out.println(count);
                System.out.println(authorId);
                System.out.println(cooperateAuthors);

            }
        } catch (IOException e)
        {
            e.printStackTrace();
        }

    }
    @Test
    public void testTempldate() {
        //可行FC81526    不可行0D8CD80
        String result = hbaseTemplate.get("cs_scholar", "0D8CD80", new RowMapper<String>() {
            public String mapRow(org.apache.hadoop.hbase.client.Result result, int i) throws Exception {
                return Bytes.toString(result.getValue("relationship".getBytes(), "cooperate".getBytes()));
            }
        });

        System.out.println(result); // 输出结果是：value1
//        hbaseTemplate.put("testTable", "r1", "cf", "q2", "value2".getBytes());

    }

    @Test
    public void testHTable() {
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", "10.1.0.188,10.1.0.187,10.1.0.183");
        conf.set("hbase.zookeeper.property.clientPort", "2181");
        Get get = new Get(Bytes.toBytes("r3"));
        try {
            HTable table = new HTable(conf, Bytes.toBytes("testTable3"));
            org.apache.hadoop.hbase.client.Result result = table.get(get);
            for (KeyValue kv : result.list()) {
                System.out.println("family:" + Bytes.toString(kv.getFamily()));
                System.out
                        .println("qualifier:" + Bytes.toString(kv.getQualifier()));
                System.out.println("value:" + Bytes.toString(kv.getValue()));
                System.out.println("Timestamp:" + kv.getTimestamp());
                System.out.println("-------------------------------------------");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void test1() {
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("a", "av");
        map.put("b", "bv");
        for (Map.Entry entry : map.entrySet()) {
            System.out.print(entry.getKey());
            System.out.print(entry.getValue());
        }
        System.out.print("111");
    }

    @Test
    public void importScholarNameTest() {
        HashMap<String, String> authorIdName = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_author_id_name.csv");  // CSV文件路径
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        try {
            while ((line = br.readLine()) != null)  //读取到的内容给line变量
            {
                count += 1;
                line.substring(0, line.indexOf(","));
                String authorId = line.substring(0, line.indexOf(","));
                String name = line.substring(line.indexOf(",") + 1);
                authorIdName.put(authorId, name);
                System.out.println(count);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : authorIdName.entrySet()) {
            String authorId = (String) entry.getKey();
            String name = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(authorId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_NAME), Bytes.toBytes(name));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_SCHOLAR));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Test
    public void getResultScanTest() {

        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", "10.1.0.188,10.1.0.187,10.1.0.183");
        conf.set("hbase.zookeeper.property.clientPort", "2181");

        List<Get> gets = new ArrayList<Get>();
        Get get1 = new Get(Bytes.toBytes("r1"));
//        Get get2 = new Get(Bytes.toBytes("r2"));
//        Get get3 = new Get(Bytes.toBytes("r3"));
//        Get get4 = new Get(Bytes.toBytes("r4"));
//        Get get5 = new Get(Bytes.toBytes("r5"));
        get1.addFamily(Bytes.toBytes("cf"));
        gets.add(get1);
//        gets.add(get2);
//        gets.add(get3);
//        gets.add(get4);
//        gets.add(get5);

        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf("testTable"));
//            results = table.getScanner(Bytes.toBytes("cf"), Bytes.toBytes("q1"));
            org.apache.hadoop.hbase.client.Result[] rs = table.get(gets);
            for (org.apache.hadoop.hbase.client.Result result : rs) {
                for (Cell cell : result.rawCells()) {
                    System.out.println(
                            "行键:" + new String(CellUtil.cloneRow(cell)) + "\t" +
                                    "列族:" + new String(CellUtil.cloneFamily(cell)) + "\t" +
                                    "列名:" + new String(CellUtil.cloneQualifier(cell)) + "\t" +
                                    "值:" + new String(CellUtil.cloneValue(cell)) + "\t" +
                                    "时间戳:" + cell.getTimestamp());
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
//            results.close();
            try {
                table.close();
                connection.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Test
    public void importRSCooperate() {
        HashMap<String, String> authorCoAuthorCount = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_author_co_author_count_list.csv");  // CSV文件路径
        BufferedReader br = null;
        try
        {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        try {
            while ((line = br.readLine()) != null)
            {
                count += 1;
                line.substring(0, line.indexOf(","));
                String authorId = line.substring(0, line.indexOf(","));
                String cooperateAuthors = line.substring(line.indexOf(",") + 1);
                cooperateAuthors = cooperateAuthors.replaceAll("\"|\\[|\\]|'", "");
                authorCoAuthorCount.put(authorId, cooperateAuthors);
                System.out.println(count);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }


        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : authorCoAuthorCount.entrySet()) {
            String authorId = (String) entry.getKey();
            String cooperateCounts = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(authorId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_COOPERATE), Bytes.toBytes(ConfigurationConstant.QF_COUNT), Bytes.toBytes(cooperateCounts));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_RELATIONSHIP));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void importAuthorIdAff() {
        HashMap<String, String> authorIdAff = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_author_id_aff2.csv");  // CSV文件路径
        BufferedReader br = null;
        try
        {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        String line = "";
        try {
            while ((line = br.readLine()) != null)
            {
                line.substring(0, line.indexOf(","));
                String authorId = line.substring(0, line.indexOf(",")).replace("\n", "");
                String aff = line.substring(line.indexOf(",") + 1).replaceAll("\"", "");
                if (aff != null && !aff.equals("")) {
                    authorIdAff.put(authorId, aff);

                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println(authorIdAff.size());
        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : authorIdAff.entrySet()) {
            String authorId = (String) entry.getKey();
            String aff = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(authorId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_AFF), Bytes.toBytes(aff));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_SCHOLAR));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void addCFTest() throws IOException {
        // Instantiating configuration class.
        Configuration conf = HBaseConfiguration.create();

        // Instantiating HBaseAdmin class.
        HBaseAdmin admin = new HBaseAdmin(conf);

        // Instantiating columnDescriptor class
        HColumnDescriptor columnDescriptor = new HColumnDescriptor(ConfigurationConstant.CF_CO_TEAM);

        // Adding column family
        admin.addColumn(ConfigurationConstant.TABLE_CS_RELATIONSHIP, columnDescriptor);
        System.out.println("coloumn added");
    }

    @Test
    public void importPaperIds() {
        HashMap<String, String> authorIdPaperIds = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_author_id_paper_ids.csv");  // CSV文件路径
        BufferedReader br = null;
        try
        {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        try {
            while ((line = br.readLine()) != null)
            {
                count += 1;
                String authorId = line.substring(0, line.indexOf(","));
                String paperIds = line.substring(line.indexOf(",") + 1);
                paperIds = paperIds.replaceAll("\"|\\[|\\]|'", "");
                System.out.println(count);
                authorIdPaperIds.put(authorId, paperIds);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }


        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : authorIdPaperIds.entrySet()) {
            String authorId = (String) entry.getKey();
            String paperIds = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(authorId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_PAPERS), Bytes.toBytes(ConfigurationConstant.QF_PAPER_IDS), Bytes.toBytes(paperIds));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_SCHOLAR));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void importPaperAuthors() {
        HashMap<String, String> paperIdAuthorIds = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_paper_authors.csv");  // CSV文件路径
        BufferedReader br = null;
        try
        {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        try {
            while ((line = br.readLine()) != null)
            {
                count += 1;
                String paperId = line.substring(0, line.indexOf(","));
                String authorIds = line.substring(line.indexOf(",") + 1);
                authorIds = authorIds.replaceAll("\"|\\[|\\]|'", "");
                System.out.println(count);
                paperIdAuthorIds.put(paperId, authorIds);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }


        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : paperIdAuthorIds.entrySet()) {
            String paperId = (String) entry.getKey();
            String authorIds = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(paperId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_AUTHORS), Bytes.toBytes(ConfigurationConstant.QF_AUTHOR_IDS), Bytes.toBytes(authorIds));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_PAPER));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void importPaperRef() {
        HashMap<String, String> paperIdRefIds = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_paper_cs_ref.csv");  // CSV文件路径
        BufferedReader br = null;
        try
        {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        try {
            while ((line = br.readLine()) != null)
            {
                count += 1;
                String paperId = line.substring(0, line.indexOf(","));
                String refIds = line.substring(line.indexOf(",") + 1);
                refIds = refIds.replaceAll("\"|\\[|\\]|'", "");
                System.out.println(count);
                paperIdRefIds.put(paperId, refIds);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }


        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : paperIdRefIds.entrySet()) {
            String paperId = (String) entry.getKey();
            String refIds = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(paperId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_REFERENCE), Bytes.toBytes(ConfigurationConstant.QF_REFED_IDS), Bytes.toBytes(refIds));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_PAPER));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void importCoPaperRef() {
        HashMap<String, String> paperIdRefIds = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_paper_cs_co_refed3.csv");  // CSV文件路径
        BufferedReader br = null;
        try
        {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        try {
            while ((line = br.readLine()) != null)
            {
                count += 1;
                String paperId = line.substring(0, line.indexOf(","));
                String refIds = line.substring(line.indexOf(",") + 1);
                refIds = refIds.replaceAll("\"|\\[|\\]|'", "");
                System.out.println(count);
                paperIdRefIds.put(paperId, refIds);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }


        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : paperIdRefIds.entrySet()) {
            String paperId = (String) entry.getKey();
            String refIds = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(paperId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_REFERENCE), Bytes.toBytes(ConfigurationConstant.QF_CO_REF_IDS), Bytes.toBytes(refIds));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_PAPER));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void filterTest() throws IOException {
        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);
        Scan scan = new Scan();
        Filter filter1 = new ValueFilter(CompareFilter.CompareOp.EQUAL, new SubstringComparator("def"));
//        Filter filter2 = new ValueFilter(CompareFilter.CompareOp.EQUAL, new SubstringComparator("def1"));
        scan.setFilter(filter1);
//        scan.setFilter(filter2);
//        scan.addColumn(Bytes.toBytes("cf"), Bytes.toBytes("num"));
//        scan.addColumn(Bytes.toBytes("cf"), Bytes.toBytes("num1"));
        connection = ConnectionFactory.createConnection(conf);
        table = connection.getTable(TableName.valueOf("testTable"));
        ResultScanner resultScanner = table.getScanner(scan);
        for (org.apache.hadoop.hbase.client.Result result : resultScanner) {
            System.out.print(Bytes.toString(result.getRow()));
//            for (Cell cell : result.rawCells()) {
//                System.out.println(new String(CellUtil.cloneRow(cell)));
//            }
        }
    }

    @Test
    public void importAuthorLatLng() throws IOException {
        HashMap<String, String> authorIdLatLng = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_author_id_latlng.csv");  // CSV文件路径
        BufferedReader br = null;
        try
        {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        try {
            while ((line = br.readLine()) != null)
            {
                count += 1;
                String authorId = line.substring(0, line.indexOf(","));
                String latlng = line.substring(line.indexOf(",") + 1);
                latlng = latlng.replaceAll("\"", "");
                System.out.println(count);
                authorIdLatLng.put(authorId, latlng);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }
//        0DE9F497 8148E2AE
        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : authorIdLatLng.entrySet()) {
            String authorId = (String) entry.getKey();
            String latlng = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(authorId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_LAT_LNG), Bytes.toBytes(latlng));
            puts.add(put);
        }

        Connection connection = HbaseUtils.getConnection();
        Table table = HbaseUtils.getTable(ConfigurationConstant.TABLE_CS_SCHOLAR, connection);
        table.put(puts);
    }

    @Test
    public void importCoTeamRef() {
        Map<String, String> authorCoTeam = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/team_file/result.txt");  // CSV文件路径
        BufferedReader br = null;
        try
        {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        try {
            while ((line = br.readLine()) != null)
            {
                count += 1;
                String[] lines = line.split(",");
                String author1 = lines[0];
                String author2 = lines[1];
                String p = lines[2];
                if (!authorCoTeam.containsKey(author1)) {
                    authorCoTeam.put(author1, author2 + ":" + p);
                } else {
                    authorCoTeam.put(author1, authorCoTeam.get(author1) + ", " + author2 + ":" + p);
                }
//                System.out.println(authorCoTeam.get(author1));

            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println(authorCoTeam.size());
        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : authorCoTeam.entrySet()) {
            String authorId = (String) entry.getKey();
            String coTeam = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(authorId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_CO_TEAM), Bytes.toBytes(ConfigurationConstant.QF_TEAM_INTENSION), Bytes.toBytes(coTeam));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_RELATIONSHIP));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void importCoCountEveYear() {
        Map<String, String> authorYearCount = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_co_authors_count_every_year.csv");  // CSV文件路径
        BufferedReader br = null;
        try
        {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        try {
            while ((line = br.readLine()) != null)
            {
                count += 1;
//                System.out.println(line);
                String authorId = line.substring(0, line.indexOf(","));
                String yearCounts = line.substring(line.indexOf(",") + 1);
                yearCounts = yearCounts.replaceAll("\"|\\[|\\]|'", "");
                authorYearCount.put(authorId, yearCounts);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println(authorYearCount.size());
        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : authorYearCount.entrySet()) {
            String authorId = (String) entry.getKey();
            String yearCount = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(authorId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_COOPERATE), Bytes.toBytes(ConfigurationConstant.QF_EVE_YEAR_COUNT), Bytes.toBytes(yearCount));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_RELATIONSHIP));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void uploadFileToHDFSTest() throws IOException {
        Configuration conf = new Configuration(true);
        conf.set("fs.default.name", "hdfs://10.1.0.188:9000");
        FileSystem fs = FileSystem.get(conf);
        Path srcPath = new Path("/home/kangwenjie/IdeaProjects/WOS/src/main/webapp/img/b.jpg");
        Path dstPath = new Path("/hbase/photo");
        fs.copyFromLocalFile(false, srcPath, dstPath);
        fs.close();
    }

    @Test
    public void downLoadFileFromHDFSTest() throws IOException {
        Configuration conf = new Configuration(true);
        conf.set("fs.default.name", "hdfs://10.1.0.188:9000");
        FileSystem fs = FileSystem.get(conf);
        Path  srcPath = new Path("/hbase/photo/b.jpg");
        InputStream in = fs.open(srcPath);
        try {
            //将文件COPY到标准输出(即控制台输出)
            IOUtils.copyBytes(in, System.out, 4096,false);
        }finally{
            IOUtils.closeStream(in);
            fs.close();
        }
    }

    @Test
    public void getAllUsers() {
        List<User> users = hbaseTemplate.find(ConfigurationConstant.TABLE_CS_USER, ConfigurationConstant.CF_SCAN_RECORD, ConfigurationConstant.QF_WEIGHT, new RowMapper<User>() {
            public User mapRow(org.apache.hadoop.hbase.client.Result result, int rowNum) throws Exception {
                String scholarWeights = Bytes.toString(result.value());
                if (StringUtils.isBlank(scholarWeights)) {
                    return null;
                }
                List<ScholarWeight> scholarWeightList = new ArrayList<ScholarWeight>();
                for (String scholarWeight : scholarWeights.split(", ")) {
                    ScholarWeight sw = new ScholarWeight();
                    sw.setIndex(scholarWeight.substring(0, scholarWeight.indexOf(":")));
                    sw.setWeight(scholarWeight.indexOf(":") + 1);
                    scholarWeightList.add(sw);
                }
                String eamil = Bytes.toString(result.getRow());
                User user = new User();
                user.setEmail(eamil);
                user.setScholarWeights(scholarWeightList);
                return user;
            }
        });
        for (User u : users) {
            System.out.println("email:" + u.getEmail());
            List<ScholarWeight> scholarWeightList = u.getScholarWeights();
            for (ScholarWeight scholarWeight : scholarWeightList) {
                System.out.println(scholarWeight.getIndex() + ", " + scholarWeight.getWeight());
            }
        }
    }

    @Test
    public void getHighHindexScholar() {

        List<Scholar> scholars = hbaseTemplate.find(ConfigurationConstant.TABLE_CS_SCHOLAR, new Scan(), new RowMapper<Scholar>() {
            public Scholar mapRow(org.apache.hadoop.hbase.client.Result result, int rowNum) throws Exception {
                Scholar scholar = new Scholar();
                scholar.setIndex(Bytes.toString(result.getRow()));
                scholar.setName(Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_NAME))));
                String latlng = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_LAT_LNG)));
                String aff = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_AFF)));
                String hindex = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_H_INDEX)));
                String qindex = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_Q_INDEX)));
                String fieldName = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_FIELD_NAME)));

                if (StringUtils.isNotBlank(latlng)) {
                    scholar.setLatlng(latlng);
                }
                if (StringUtils.isNotBlank(aff)) {
                    scholar.setAff(aff);
                }
                if (StringUtils.isNotBlank(hindex)) {
                    scholar.setHindex(Double.parseDouble(hindex));
                }
                if (StringUtils.isNotBlank(qindex)) {
                    scholar.setQindex(Double.parseDouble(qindex));
                }
                if (StringUtils.isNotBlank(fieldName)) {
                    scholar.setFieldName(fieldName);
                }
                return scholar;
            }
        });
        System.out.println(scholars.size());
        Collections.sort(scholars, new Comparator<Scholar>() {
            public int compare(Scholar o1, Scholar o2) {
                if (o1.getHindex() > o2.getHindex()) {
                    return -1;
                }
                if (o1.getHindex() < o2.getHindex()) {
                    return 1;
                }
                return 0;
            }
        });
//        List<Scholar> hindex0_2 = new LinkedList<Scholar>();
//        List<Scholar> hindex2_5 = new LinkedList<Scholar>();
//        List<Scholar> hindex5_10 = new LinkedList<Scholar>();
//        List<Scholar> hindex10_20 = new LinkedList<Scholar>();
//        List<Scholar> hindex20_50 = new LinkedList<Scholar>();
//        List<Scholar> hindex50_100 = new LinkedList<Scholar>();
//        for (Scholar scholar : scholars) {
//            double hindex = scholar.getHindex();
//            if (hindex < 2) {
//                hindex0_2.add(scholar);
//            } else if (hindex < 5) {
//                hindex2_5.add(scholar);
//            } else if (hindex < 10) {
//                hindex5_10.add(scholar);
//            } else if (hindex < 20) {
//                hindex10_20.add(scholar);
//            } else if (hindex < 50) {
//                hindex20_50.add(scholar);
//            } else {
//                hindex50_100.add(scholar);
//            }
//        }
//        System.out.println(hindex0_2.size());
//        System.out.println(hindex2_5.size());
//        System.out.println(hindex5_10.size());
//        System.out.println(hindex10_20.size());
//        System.out.println(hindex20_50.size());
//        System.out.println(hindex50_100.size());


//        jedisCluster.set(ConfigurationConstant.REDIS_ALL_SCHOLARS.getBytes(), ListTranscoder.serialize(scholars));

        List<Scholar> top10Scholars = new ArrayList<Scholar>();
        for (int i = 0; i < 10; i++) {
            top10Scholars.add(scholars.get(i));
        }
        List<Scholar> top100Scholars = new ArrayList<Scholar>();
        for (int i = 0; i < 100; i++) {
            top100Scholars.add(scholars.get(i));
        }
        jedisCluster.set(ConfigurationConstant.REDIS_HINDEX_TOP10_SCHOLARS.getBytes(), ListTranscoder.serialize(top10Scholars));
        jedisCluster.set(ConfigurationConstant.REDIS_HINDEX_TOP100_SCHOLARS.getBytes(), ListTranscoder.serialize(top100Scholars));
//        jedisCluster.del("redis_top10_scholars");

    }

    @Test
    public void testAff() {
        hbaseTemplate.get(ConfigurationConstant.TABLE_CS_SCHOLAR, "822F2CBF", ConfigurationConstant.CF_PERSONAL_INFO, ConfigurationConstant.QF_AFF, new RowMapper<Scholar>() {
            public Scholar mapRow(org.apache.hadoop.hbase.client.Result result, int rowNum) throws Exception {
                String aff = Bytes.toString(result.value());
                System.out.println(aff);
                return null;
            }
        });
    }

    @Test
    public void importTeacherStudentTest() {
        Map<String, String> teaStudentsMap = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/tea_stu/cs_tea_stu.csv");  // CSV文件路径
        BufferedReader br = null;
        try
        {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        try {
            while ((line = br.readLine()) != null)
            {
                count += 1;
//                System.out.println(line);
//                if (count > 10) {
//                    return;
//                }
                String teacher = line.substring(0, line.indexOf(","));
                String students = line.substring(line.indexOf(",") + 1);
                students = students.replaceAll("\"|\\[|\\]|'", "");
                teaStudentsMap.put(teacher, students);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println(teaStudentsMap.size());
        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : teaStudentsMap.entrySet()) {
            String teacherId = (String) entry.getKey();
            String studentsId = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(teacherId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_TEACHER_STUDENT), Bytes.toBytes(ConfigurationConstant.QF_STUDENTS), Bytes.toBytes(studentsId));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_RELATIONSHIP));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void importStudentTeacherTest() {
        Map<String, String> stuTeaMap = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/tea_stu/2010/cs_relation_2010_2.csv");  // CSV文件路径
        BufferedReader br = null;
        try
        {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        try {
            br.readLine();
            while ((line = br.readLine()) != null)
            {
                count += 1;
//                System.out.println(line);
//                if (count > 10) {
//                    return;
//                }
                String[] lines = line.split(",");
                stuTeaMap.put(lines[0], lines[1]);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println(stuTeaMap.size());
        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : stuTeaMap.entrySet()) {
            String studentId = (String) entry.getKey();
            String teacherId = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(studentId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_TEACHER_STUDENT), Bytes.toBytes(ConfigurationConstant.QF_TEACHER), Bytes.toBytes(teacherId));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_RELATIONSHIP));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void importPersonalTagsTest() {
        Map<String, String> authorField = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/tags/cs_authorid_fieldname_top5refed.csv");  // CSV文件路径
        BufferedReader br = null;
        try
        {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        try {
            while ((line = br.readLine()) != null)
            {
//                count += 1;
//                if (count > 10) {
//                    return;
//                }

                String[] lines = line.split(",");
                String fieldName = lines[1];
                fieldName = fieldName.replaceAll("\"", "");
//                System.out.println(line);

                authorField.put(lines[0], fieldName);
//                if (lines[0].equals("0DE9F497")) {
//                    System.out.println(lines);
//                    return;
//                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println(authorField.size());
        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : authorField.entrySet()) {
            String authorId = (String) entry.getKey();
            String fieldName = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(authorId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_FIELD_NAME), Bytes.toBytes(fieldName));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_SCHOLAR));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void importStatisticalTest() {
        Map<String, String> map = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/statistical/cs_authorid_studentsnumber.csv");  // CSV文件路径
        BufferedReader br = null;
        try
        {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        try {
            while ((line = br.readLine()) != null)
            {
//                count += 1;
//                if (count > 10) {
//                    return;
//                }

                String[] lines = line.split(",");
//                System.out.println(line);

                map.put(lines[0], lines[1]);
//                if (lines[0].equals("0DE9F497")) {
//                    System.out.println(lines);
//                    return;
//                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println(map.size());
        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : map.entrySet()) {
            String authorId = (String) entry.getKey();
            String value = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(authorId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_STUDENTS_NUMBER), Bytes.toBytes(value));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_SCHOLAR));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void setStatisticalTest() {

        List<Scholar> scholars = hbaseTemplate.find(ConfigurationConstant.TABLE_CS_SCHOLAR, new Scan(), new RowMapper<Scholar>() {
            public Scholar mapRow(org.apache.hadoop.hbase.client.Result result, int rowNum) throws Exception {
                Scholar scholar = new Scholar();
                scholar.setIndex(Bytes.toString(result.getRow()));
                scholar.setName(Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_NAME))));
                String latlng = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_LAT_LNG)));
                String aff = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_AFF)));
                String hindex = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_H_INDEX)));
                String qindex = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_Q_INDEX)));
                String fieldName = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_FIELD_NAME)));
                String cooperateNumber = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_STUDENTS_NUMBER)));


                if (StringUtils.isNotBlank(latlng)) {
                    scholar.setLatlng(latlng);
                }
                if (StringUtils.isNotBlank(aff)) {
                    scholar.setAff(aff);
                }
                if (StringUtils.isNotBlank(hindex)) {
                    scholar.setHindex(Double.parseDouble(hindex));
                }
                if (StringUtils.isNotBlank(qindex)) {
                    scholar.setQindex(Double.parseDouble(qindex));
                }
                if (StringUtils.isNotBlank(fieldName)) {
                    scholar.setFieldName(fieldName);
                }
                if (StringUtils.isNotBlank(cooperateNumber)) {
                    scholar.setStudentsNumber(Integer.parseInt(cooperateNumber));
                }
                return scholar;
            }
        });
        System.out.println(scholars.size());
        Collections.sort(scholars, new Comparator<Scholar>() {
            public int compare(Scholar o1, Scholar o2) {
                if (o1.getStudentsNumber() > o2.getStudentsNumber()) {
                    return -1;
                }
                if (o1.getStudentsNumber() < o2.getStudentsNumber()) {
                    return 1;
                }
                return 0;
            }
        });
//        jedisCluster.set(ConfigurationConstant.REDIS_ALL_SCHOLARS.getBytes(), ListTranscoder.serialize(scholars));

        List<Scholar> top100Scholars = new ArrayList<Scholar>();
        for (int i = 0; i < 100; i++) {
            top100Scholars.add(scholars.get(i));
        }
        jedisCluster.set(ConfigurationConstant.REDIS_STUDENTS_NUMBER_TOP100_SCHOLARS.getBytes(), ListTranscoder.serialize(top100Scholars));
    }

    @Test
    public void isEmailExist() {
        boolean isExist = hbaseTemplate.get(ConfigurationConstant.TABLE_CS_USER, "test@123.com", new RowMapper<Boolean>() {
            public Boolean mapRow(org.apache.hadoop.hbase.client.Result result, int rowNum) throws Exception {
                return result.isEmpty();
            }
        });
        System.out.println(isExist);
    }

    @Test
    public void importScholarHindex() {
        HashMap<String, String> authorIdHindex = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/statistical/q_index.csv");  // CSV文件路径
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        try {
            while ((line = br.readLine()) != null)  //读取到的内容给line变量
            {
                count += 1;
                line.substring(0, line.indexOf(","));
                String authorId = line.substring(0, line.indexOf(","));
                String hindex = line.substring(line.indexOf(",") + 1);
                authorIdHindex.put(authorId, hindex);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(authorIdHindex.size());
        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : authorIdHindex.entrySet()) {
            String authorId = (String) entry.getKey();
            String hindex = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(authorId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_Q_INDEX), Bytes.toBytes(hindex));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_SCHOLAR));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void setAuthorIdHindexRedis() {
        List<Scholar> scholars = hbaseTemplate.find(ConfigurationConstant.TABLE_CS_SCHOLAR, new Scan(), new RowMapper<Scholar>() {
            public Scholar mapRow(org.apache.hadoop.hbase.client.Result result, int rowNum) throws Exception {
                Scholar scholar = new Scholar();
                scholar.setIndex(Bytes.toString(result.getRow()));
                String hindex = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_H_INDEX)));
                String qindex = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_Q_INDEX)));
                if (StringUtils.isNotBlank(hindex)) {
                    scholar.setHindex(Double.parseDouble(hindex));
                }
                if (StringUtils.isNotBlank(qindex)) {
                    scholar.setQindex(Double.parseDouble(qindex));
                }
                return scholar;
            }
        });
        System.out.println(scholars.size());
        Collections.sort(scholars, new Comparator<Scholar>() {
            public int compare(Scholar o1, Scholar o2) {
                if (o1.getQindex() > o2.getQindex()) {
                    return -1;
                }
                if (o1.getQindex() < o2.getQindex()) {
                    return 1;
                }
                return 0;
            }
        });
        int count = 0;
        HashMap<String, String> m1 = new HashMap<String, String>();
        HashMap<String, String> m2 = new HashMap<String, String>();
        HashMap<String, String> m3 = new HashMap<String, String>();
        HashMap<String, String> m4 = new HashMap<String, String>();
        for (Scholar scholar : scholars) {
            if (count <= 500000) {
                jedisCluster.rpush(ConfigurationConstant.REDIS_QINDEX_0_50W, scholar.getIndex());
                m1.put(scholar.getIndex(), String.valueOf(scholar.getQindex()));
            } else if (count <= 1000000) {
                jedisCluster.rpush(ConfigurationConstant.REDIS_QINDEX_50_100W, scholar.getIndex());
                m2.put(scholar.getIndex(), String.valueOf(scholar.getQindex()));
            } else if (count <= 1500000) {
                jedisCluster.rpush(ConfigurationConstant.REDIS_QINDEX_100_150W, scholar.getIndex());
                m3.put(scholar.getIndex(), String.valueOf(scholar.getQindex()));
            } else {
                jedisCluster.rpush(ConfigurationConstant.REDIS_QINDEX_150_200W, scholar.getIndex());
                m4.put(scholar.getIndex(), String.valueOf(scholar.getQindex()));
            }
            count += 1;
        }
        jedisCluster.hmset(ConfigurationConstant.REDIS_AUTHORID_QINDEX_0_50W, m1);
        jedisCluster.hmset(ConfigurationConstant.REDIS_AUTHORID_QINDEX_50_100W, m2);
        jedisCluster.hmset(ConfigurationConstant.REDIS_AUTHORID_QINDEX_100_150W, m3);
        jedisCluster.hmset(ConfigurationConstant.REDIS_AUTHORID_QINDEX_150_200W, m4);

    }

}
