import com.thinkaurelius.titan.core.TitanFactory;
import com.thinkaurelius.titan.core.TitanGraph;
import org.apache.commons.configuration.BaseConfiguration;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.tinkerpop.gremlin.process.traversal.dsl.graph.GraphTraversalSource;
import org.apache.tinkerpop.gremlin.structure.Edge;
import org.apache.tinkerpop.gremlin.structure.Vertex;
import org.junit.Test;
import org.junit.runner.Result;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.data.hadoop.hbase.RowMapper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = "/WEB-INF/applicationContext.xml")
public class HbaseTest {
    private static final String TABLE_NAME    = "test";
    private static final String ROW_KEY       = "row1";
    private static final String COLUMN_FAMILY = "cf";
    private static final String QUALIFIER     = "a";
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

    @Test
    public void titanTest(){
        BaseConfiguration baseConfiguration = new BaseConfiguration();
        baseConfiguration.setProperty("storage.backend", "hbase");
        baseConfiguration.setProperty("storage.hostname", "127.0.0.1");
        baseConfiguration.setProperty("storage.tablename","titan");
        baseConfiguration.setProperty("index.search.backend","elasticsearch");
        baseConfiguration.setProperty("index.search.hostname","127.0.0.1");

        TitanGraph titanGraph = TitanFactory.open(baseConfiguration);
        GraphTraversalSource g = titanGraph.traversal();
        Vertex saturn = g.V().has("name", "saturn").next();
        System.out.print(saturn);
    }

    @Test
    public void importCooperateScholarTest() {
        
    }
}
