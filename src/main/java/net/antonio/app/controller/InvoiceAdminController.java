package net.antonio.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.antonio.app.model.Invoice;
import net.antonio.app.services.InvoiceService;

@Controller
@RequestMapping("/admin/invoices")
public class InvoiceAdminController {

	@Autowired
	private InvoiceService invoiceService;

	@RequestMapping(method = RequestMethod.GET)
	public String register(ModelMap modelMap) {
		modelMap.put("invoices", invoiceService.findAllWithOrders());
		return "admin.invoice.index";
	}

	@RequestMapping(value = "details/{id}", method = RequestMethod.GET)
	public String details(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.put("invoices", invoiceService.findById(id));
		return "admin.invoice.details";
	}

	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") int id, ModelMap modelMap) {
		Invoice invoice = invoiceService.findById(id);
		invoice.setStatus("done");
		invoiceService.save(invoice);
		return "redirect:/admin/invoices";
	}

}
