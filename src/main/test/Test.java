import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.thealpha.controller.CreateHtml;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-servlet.xml"})
public class Test{
    @Autowired
    private CreateHtml createHtml;

    @org.junit.Test
    public void justTest() {
        createHtml.test();
    }
    @org.junit.Test
    public void test2() {
        System.out.print("test");
    }



}
