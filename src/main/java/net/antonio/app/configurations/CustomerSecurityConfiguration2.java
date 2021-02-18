package net.antonio.app.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.context.SecurityContextPersistenceFilter;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter;

import net.antonio.app.services.AccountService;

@EnableWebSecurity
@Configuration
@Order(1)
public class CustomerSecurityConfiguration2 extends WebSecurityConfigurerAdapter {

	@Autowired
	private AccountService accountService;
	
	@Override
	protected void configure(HttpSecurity httpSecurity) throws Exception {
		
		httpSecurity.cors().and().csrf().disable();
		
		httpSecurity.antMatcher("/customer/**").authorizeRequests()
					.antMatchers("/customer/register").permitAll()
					.antMatchers("/customer/**").access("hasRole('ROLE_CUSTOMER')")
					.and()
					.formLogin().loginPage("/customer-panel")
					.loginProcessingUrl("/customer/process-login")
					.defaultSuccessUrl("/customer-panel/welcome")
					.failureUrl("/customer-panel/login?error")
					.usernameParameter("username").passwordParameter("password")
					.and()
//					.logout().logoutUrl("/customer-panel/process-logout")
					.logout().logoutUrl("/customer/process-logout")
					.logoutSuccessUrl("/customer-panel/login?logout")
					.deleteCookies("JSESSIONID")
					.and()
					.exceptionHandling().accessDeniedPage("/customer-panel/accessDenied");
	}
	
	@Autowired
	protected void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(accountService);
	}
	
	@Bean
	public BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public SecurityContextHolderAwareRequestFilter awareRequestFilter() {
		return new SecurityContextHolderAwareRequestFilter();
	}
	
	@Bean
	public SecurityContextPersistenceFilter persistenceFilter() {
		return new SecurityContextPersistenceFilter();
	}
	
}
