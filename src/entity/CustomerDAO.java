package entity;

import java.util.List;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;

import com.google.gson.Gson;

public class CustomerDAO {
List<Customer> customerList=null;
public CustomerDAO()
{
	PersistenceManager pm = JDOHelper.getPersistenceManagerFactory("transactions-optional").getPersistenceManager();
	javax.jdo.Query q = pm.newQuery(Customer.class);
	Gson a = new Gson();
	String json1;
	try {
		customerList = (List<Customer>) q.execute();
		//json1=a.toJson(customerList);
		//System.out.println(json1);
	} finally {
		
	}

}

public Customer getByName(String Name) {

	for (Customer c : customerList) {
		if (c.getCustomerName().equals(Name)) {
			return c;
		}
	}
	return null;
}

public Customer getByEMail(String eMail) {

	for (Customer c : customerList) {
		if (c.getEmailID().contains(eMail)) {
			return c;
		}
	}
	return null;
}


public Customer getByMobileNumber(String MobileNo) {

	for (Customer c : customerList) {
		if (c.getMobileNo().equals(MobileNo)) {
			return c;
		}
	}
	return null;
}

}
