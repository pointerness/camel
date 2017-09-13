package brainless.labs.camel.demo.test.service;

import javax.annotation.Resource;

import org.apache.camel.CamelContext;
import org.apache.camel.test.junit4.CamelTestSupport;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DynamicRouteConfigBuilderServiceTest extends CamelTestSupport
{
    @Resource
    CamelContext camelContext;

    @Test
    public void testRoutes(){
	assertNotNull(camelContext);
	assertFalse(camelContext.getRoutes().isEmpty());
	assertTrue(camelContext.getRoutes().size() == 2);
    }

}
