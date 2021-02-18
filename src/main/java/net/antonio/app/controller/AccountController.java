package net.antonio.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.antonio.app.model.Account;
import net.antonio.app.services.AccountService;

@Controller
@RequestMapping("/admin/account")
public class AccountController {

	@Autowired
	private AccountService accountService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("customers", accountService.findAll());
		// map.addAttribute("customers", accountService.findAllCustomer(2));
		return "admin.customer.index";
	}

	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String profile(Authentication authentication, ModelMap modelMap) {
		modelMap.put("account", accountService.findByUsername(authentication.getName()));
		return "admin.account.profile";
	}

	@RequestMapping(value = "profile", method = RequestMethod.POST)
	public String profile(@ModelAttribute("account") Account account, ModelMap modelMap) {
		Account currentAccount = accountService.findById(account.getId());

		if (!account.getPassword().isEmpty()) {
			String hash = new BCryptPasswordEncoder().encode(account.getPassword());
			currentAccount.setPassword(hash);
		}

		currentAccount.setUsername(account.getUsername());
		currentAccount.setEmail(account.getEmail());
		currentAccount.setFullname(account.getFullname());
		currentAccount.setPhone(account.getPhone());
		currentAccount.setAddress(account.getAddress());
		accountService.save(currentAccount);

		return "redirect:/admin/dashboard";
	}

}
