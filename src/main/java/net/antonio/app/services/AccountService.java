package net.antonio.app.services;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import net.antonio.app.model.Account;

public interface AccountService extends UserDetailsService {
	
	public Account findByUsername(String username);
	
	public Account findById(int id);
	
	public Account save(Account account);
	
	public Iterable<Account> findAll();
	public List<Account> findAllCustomer(int roleId);
	
	public Long countCustomer(int roleId);
	
}
