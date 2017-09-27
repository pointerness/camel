package brainless.labs.camel.demo.config;

import java.util.HashMap;
import java.util.Map;

import brainless.labs.camel.demo.service.CamelRouteURLBuilder;

public class RouteDefinition {
	private String path;
	private final Map<String, String> camelConfig = new HashMap<>();
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Map<String, String> getCamelConfig() {
		return camelConfig;
	}
	
	public String getURL(){
		return CamelRouteURLBuilder.getURL(this);
	}
}
