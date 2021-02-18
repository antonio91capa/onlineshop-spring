package net.antonio.app.services;

import java.util.List;

import net.antonio.app.model.Invoice;

public interface InvoiceService {

	public Invoice save(Invoice invoice);

	public List<Invoice> findAllWithOrders(String username);

	public Invoice findById(int id);

	public List<Invoice> findAllWithOrders();
	
	public Long countNewInvoice(String status);

}
