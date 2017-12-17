import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.thealpha.controller.CreateHtml;

import java.util.Arrays;
import java.util.List;

//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath:spring-servlet.xml"})
public class Test{
    @org.junit.Test
    public void test2() {
        String[] a = {"a", "b"};
        List<String> b = Arrays.asList(a);
        System.out.print(b.get(0));

    }



}
