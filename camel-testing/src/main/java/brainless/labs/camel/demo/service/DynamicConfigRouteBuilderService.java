package brainless.labs.camel.demo.service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.camel.CamelContext;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import brainless.labs.camel.demo.config.Route;
import brainless.labs.camel.demo.config.RouteConfig;
import brainless.labs.camel.demo.routes.DynamicRouteBuilder;

@Service
public class DynamicConfigRouteBuilderService {
	Logger logger = Logger.getLogger(getClass());
	@Resource
	RouteConfig routeConfig;

	@Resource
	CamelContext camelContext;

	@PostConstruct
	private void buildRoutes() {
		for (Route route : routeConfig.getRouteList()) {
			try {
				camelContext.addRoutes(new DynamicRouteBuilder(route));
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
		}
	}
}