package com.infosys.osmosis.microservices;

import org.apache.camel.ExchangePattern;
import org.apache.camel.ProducerTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("restClient")
public class RestClient {
	@Autowired
	ProducerTemplate camelTemplate;

	public Object doPost(Person person) {

		return camelTemplate.sendBody("direct:saveBeneficiary",
				ExchangePattern.InOut, person);
	}

	public Object doGet() {
		Object Person = camelTemplate.requestBody("direct:getBeneficiary", "");
		System.out.println(Person);
		return Person;
	}
}
