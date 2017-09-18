package brainless.labs.camel.demo.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;


public class Route
{
    private String routeId;
    private RouteDefinition source;
    private final List<RouteDefinition> destinations = new ArrayList<>();

    public String getRouteId()
    {
	return routeId;
    }

    public void setRouteId(String routeId)
    {
	this.routeId = routeId;
    }

	public RouteDefinition getSource() {
		return source;
	}

	public void setSource(RouteDefinition source) {
		this.source = source;
	}

	public List<RouteDefinition> getDestinations() {
		return destinations;
	}

}
