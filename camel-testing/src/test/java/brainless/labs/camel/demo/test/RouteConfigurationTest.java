package brainless.labs.camel.demo.test;

import javax.annotation.Resource;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import brainless.labs.camel.demo.config.RouteConfig;

@RunWith(SpringRunner.class)
@SpringBootTest()
public class RouteConfigurationTest {
	@Resource
	RouteConfig routeConfig;

	@Test
	public void testConfig() {
		Assert.assertNotNull(routeConfig);
		Assert.assertFalse(routeConfig.getRouteList().isEmpty());
		Assert.assertNotNull(routeConfig.getRouteList().get(0).getSource());
		Assert.assertFalse(routeConfig.getRouteList().get(0).getDestinations().isEmpty());
	}
}
