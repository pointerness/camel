package brainless.labs.camel.demo.routes;

import org.apache.camel.builder.RouteBuilder;

import brainless.labs.camel.demo.config.Route;

public class DynamicRouteBuilder extends RouteBuilder
{
    Route route;

    public DynamicRouteBuilder(Route route)
    {
	super();
	this.route = route;
    }

    @Override
    public void configure() throws Exception
    {
	String[] destinations = route.getDestinations().toArray(new String[route.getDestinations().size()]);
	from(route.getSource().getPath()).routeId(route.getRouteId()).multicast().to(destinations);

    }

}
