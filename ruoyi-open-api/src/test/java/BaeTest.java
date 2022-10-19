import com.ruoyi.openapi.service.OpenApiUserService;
import org.junit.Before;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author xiezhonggui
 */
public class BaeTest {
    public OpenApiUserService openApiUserService;

    @Before
    public void init() {

        //用户相关
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContextTest.xml");
        openApiUserService = applicationContext.getBean(OpenApiUserService.class);
        System.out.println(openApiUserService.toString());
    }
}
