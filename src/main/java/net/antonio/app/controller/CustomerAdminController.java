package net.antonio.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.antonio.app.services.AccountService;
import net.antonio.app.services.InvoiceService;

@Controller
@RequestMapping("/admin/customer")
public class CustomerAdminController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private InvoiceService invoiceService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String register(ModelMap modelMap) {
		modelMap.put("customers", accountService.findAllCustomer(2));
		return "admin.customer.index";
	}
	
	@RequestMapping(value="invoices/{username}",method = RequestMethod.GET)
	public String invoices(@PathVariable("username") String username,ModelMap modelMap) {
		modelMap.put("invoices", invoiceService.findAllWithOrders(username));
		return "admin.customer.invoices";
	}

}
