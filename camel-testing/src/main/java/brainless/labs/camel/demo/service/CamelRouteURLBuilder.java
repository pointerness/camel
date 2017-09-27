package brainless.labs.camel.demo.service;

import java.util.Map;
import java.util.Map.Entry;

import org.springframework.util.StringUtils;

import brainless.labs.camel.demo.config.RouteDefinition;

public class CamelRouteURLBuilder {
	public static String getURL(RouteDefinition routeDefinition) {
		StringBuffer url = new StringBuffer();
		url.append(routeDefinition.getPath()).append("?");
		for (Entry<String, String> option : routeDefinition.getCamelConfig().entrySet()) {
			url.append(option.getKey()).append("=").append(option.getValue()).append("&");
		}
		return StringUtils.trimTrailingCharacter(url.toString(), '&');
	}

	public static void main(String[] args) {
		RouteDefinition routeDefinition = new RouteDefinition();
		routeDefinition.setPath("azure-blob://datastorage/camel/BLOB1");
		Map<String, String> options = routeDefinition.getCamelConfig();
		options.put("operation", "listBlob");
		options.put("credentials", "#credential");
		System.out.println("url = " + getURL(routeDefinition));
	}
}
