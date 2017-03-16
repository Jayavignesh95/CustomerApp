package com.app;

import java.util.List;
import java.util.Map;
import entity.Customer;
import entity.CustomerDAO;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.*;
import com.google.appengine.labs.repackaged.org.json.JSONObject;

import entity.Customer;

@Controller
public class CustomerController {

	@RequestMapping(value = "/add")
	public void addCustomer(@RequestBody String reqString) {

		System.out.println(reqString);
		Gson s = new Gson();
		Customer customer = s.fromJson(reqString, Customer.class);
		System.out.println(customer.getCustomerName());

		System.out.println("add working");
		PersistenceManager pm = JDOHelper.getPersistenceManagerFactory("transactions-optional").getPersistenceManager();
		try {
			pm.makePersistent(customer);
			System.out.println("ADDED");

		} finally {
			pm.close();
		}

	}

	@RequestMapping(value = "/view", method = RequestMethod.GET,produces="application/json")
	@ResponseBody
	public String CustomerList() {

		PersistenceManager pm = JDOHelper.getPersistenceManagerFactory("transactions-optional").getPersistenceManager();
		javax.jdo.Query q = pm.newQuery(Customer.class);
		List<Customer> results = null;
		Gson a = new Gson();
		String json1;
		try {
			results = (List<Customer>) q.execute();
			json1=a.toJson(results);
			System.out.println(json1);
		} finally {
			q.closeAll();
			pm.close();
		}
		return json1;

	}
	
	@RequestMapping(value="/customer/name/{srchterm}",method= RequestMethod.GET,produces="application.json")
	@ResponseBody
	public String getCustomerByID(@PathVariable String srchterm)
	{
		
		
		Gson a = new Gson();
		CustomerDAO cust=new CustomerDAO();
		Customer c=cust.getByName(srchterm);
		System.out.println(c.getCustomerName());
		return a.toJson(c);
		
	}

	@RequestMapping(value="/customer/email/{srchterm}",method= RequestMethod.GET,produces="application.json")
	public String getCustomerByEMail(@PathVariable String srchterm)
	{
		CustomerDAO cust=new CustomerDAO();
		Customer c=cust.getByEMail(srchterm);
		System.out.println(c.getEmailID());
		return null;
		
	}
	
	
	
	
}
