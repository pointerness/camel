package brainless.labs.camel.demo.routes;

import java.io.InputStream;
import java.util.stream.Collectors;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.component.file.GenericFile;
import org.apache.camel.component.file.GenericFileConverter;

import brainless.labs.camel.demo.config.Route;

public class DynamicRouteBuilder extends RouteBuilder {
	Route route;

	public DynamicRouteBuilder(Route route) {
		super();
		this.route = route;
	}

	@Override
	public void configure() throws Exception {
		interceptSendToEndpoint("azure-blob:*").process(new Processor() {

			@Override
			public void process(Exchange exchange) throws Exception {
				InputStream inputStream = GenericFileConverter
						.genericFileToInputStream((GenericFile<?>) exchange.getIn().getMandatoryBody(), exchange);
				exchange.getOut().setBody(inputStream);
			}
		});
		String[] destinations = new String[route.getDestinations().size()];
		route.getDestinations().stream().map(r -> r.getURL()).collect(Collectors.toList()).toArray(destinations);
		from(route.getSource().getPath()).routeId(route.getRouteId()).multicast().to(destinations);

	}

}
