package com.infosys.osmosis.microservices;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class SpringMVCController {
	@Autowired
	RestClient restClient;
	@RequestMapping(value = "/PostFormData", method = RequestMethod.POST,consumes = {"application/json;charset=UTF-8"}, produces={"application/json;charset=UTF-8"})
	public @ResponseBody Object PostService(@RequestBody Person person) {
		return restClient.doPost(person);
	}

/*	@RequestMapping(value = "/PostFormDataByParam", method = RequestMethod.POST,consumes = {"application/json;charset=UTF-8"}, produces={"application/json;charset=UTF-8"})
	public @ResponseBody Person PostFormDataByParam(HttpServletRequest request) {
		
		Person person = new Person();
		person.setFirstName(request.getParameter("firstName"));
		person.setLastName(request.getParameter("lastName"));
		return person;
	}*/
	
	@RequestMapping(value = "/GetFormData", method = RequestMethod.GET, produces={"application/json;charset=UTF-8"})
	public @ResponseBody Object GetService() {
		return restClient.doGet();
		
	}

}
