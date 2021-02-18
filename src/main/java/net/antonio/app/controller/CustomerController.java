package net.antonio.app.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.antonio.app.model.Account;
import net.antonio.app.model.Role;
import net.antonio.app.services.AccountService;
import net.antonio.app.services.InvoiceService;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
	
	private static final Logger log=LoggerFactory.getLogger(CustomerController.class);

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private InvoiceService invoiceService;

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(ModelMap modelMap) {
		modelMap.put("account", new Account());
		return "customer.register";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(@ModelAttribute("account") Account account, ModelMap modelMap) {
		try {
			String hash = new BCryptPasswordEncoder().encode(account.getPassword());
			account.setPassword(hash);
			account.setStatus(true);
			account.setRole(new Role(2));
			accountService.save(account);
			log.info(" ---> User saved successfully");
			
			return "redirect:/customer-panel";
		} catch (Exception e) {
			modelMap.put("error", e.getMessage());
			return "customer.register";
		}
	}

	@RequestMapping(value = "dashboard", method = RequestMethod.GET)
	public String dashboard(ModelMap modelMap) {
		return "customer.dashboard";
	}

	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String profile(Authentication authentication, ModelMap modelMap) {
		modelMap.put("customer", accountService.findByUsername(authentication.getName()));
		return "customer.profile";
	}

	@RequestMapping(value = "profile", method = RequestMethod.POST)
	public String profile(@ModelAttribute("customer") Account customer, ModelMap modelMap) {
		try {
			Account currentAccount = accountService.findById(customer.getId());
			if (!customer.getPassword().isEmpty()) {
				String hash = new BCryptPasswordEncoder().encode(customer.getPassword());
				currentAccount.setPassword(hash);
			}

			currentAccount.setAddress(customer.getAddress());
			currentAccount.setEmail(customer.getEmail());
			currentAccount.setFullname(customer.getFullname());
			currentAccount.setPhone(customer.getPhone());
			accountService.save(currentAccount);
			modelMap.put("msg", "Profile updated successfully!");
			
			return "redirect:/customer/dashboard";
		} catch (Exception e) {
			modelMap.put("error", e.getMessage());
			return "customer.register";
		}
	}
	
	@RequestMapping(value = "history", method = RequestMethod.GET)
	public String history(Authentication authentication, ModelMap modelMap) {
		modelMap.put("invoices", invoiceService.findAllWithOrders(authentication.getName()));
		return "customer.history";
	}
	
	@RequestMapping(value = "invoicedetails/{id}", method = RequestMethod.GET)
	public String invoicedetails(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.put("invoices", invoiceService.findById(id));
		return "customer.invoicedetails";
	}

}
