package brainless.labs.camel.demo.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix="routes")
public class RouteConfig
{

    final List<Route> routeList = new ArrayList<Route>();

    public List<Route> getRouteList()
    {
        return routeList;
    }

}
