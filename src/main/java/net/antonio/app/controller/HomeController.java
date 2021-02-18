package net.antonio.app.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.antonio.app.services.ProductService;

@Controller
@RequestMapping(value = { "", "home" })
public class HomeController {
	
	private static final Logger log=LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ProductService productService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		log.info("Page Home");
		modelMap.put("isHome", true);
		modelMap.put("featuredProducts", productService.featuredProducts(true, true, 6));
		modelMap.put("latestProducts", productService.latestProducts(true, 6));
		
		return "home.index";
	}

}
