import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.ruoyi.openapi.domain.OpenApiUser;
import org.junit.Test;

import java.util.Date;
import java.util.UUID;

/**
 * @author xiezhonggui
 */
public class OpenUserTest extends BaeTest {


    @Test
    public void testInsert() {
        OpenApiUser openApiUser = new OpenApiUser();
        openApiUser.setUserId(UUID.randomUUID().toString());
        openApiUser.setAccount("admin");
        openApiUser.setPassword("admin");
        openApiUser.setCreateTime(new Date());
        openApiUser.setUpdateTime(new Date());
        boolean result = openApiUserService.save(openApiUser);
        System.out.println("插入结果：" + result);
    }

    @Test
    public void testUpdate() {
        OpenApiUser openApiUser = new OpenApiUser();
        openApiUser.setUserId("5ad325a7-cd41-485e-81f9-66068756b4fb");
        openApiUser.setAccount("admin11");
        boolean result = openApiUserService.updateById(openApiUser);
        System.out.println("更新结果：" + result);
    }

    @Test
    public void testFind() {
        OpenApiUser openApiUser = openApiUserService.getById("5ad325a7-cd41-485e-81f9-66068756b4fb");
        System.out.println("查询结果：" + openApiUser);
    }

    @Test
    public void testFindByAccount() {
        LambdaQueryWrapper<OpenApiUser> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(OpenApiUser::getAccount, "admin11");
        OpenApiUser openApiUser = openApiUserService.getOne(lambdaQueryWrapper);
        System.out.println("查询结果：" + openApiUser);
    }
}
