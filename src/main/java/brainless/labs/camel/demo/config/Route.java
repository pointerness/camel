package brainless.labs.camel.demo.config;

import java.util.List;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "routes.routeList")
public class Route
{
    private String routeId;
    private String source;
    private List<String> destinations;

    public String getRouteId()
    {
	return routeId;
    }

    public void setRouteId(String routeId)
    {
	this.routeId = routeId;
    }

    public String getSource()
    {
	return source;
    }

    public void setSource(String source)
    {
	this.source = source;
    }

    public List<String> getDestinations()
    {
	return destinations;
    }

    public void setDestinations(List<String> destinations)
    {
	this.destinations = destinations;
    }
}
