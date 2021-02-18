package net.antonio.app.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.antonio.app.model.Invoice;
import net.antonio.app.repositories.InvoiceRepository;

@Service("invoiceService")
@Transactional
public class InvoiceServiceImpl implements InvoiceService {

	@Autowired
	private InvoiceRepository invoiceRepository;

	@Override
	public Invoice save(Invoice invoice) {
		return invoiceRepository.save(invoice);
	}

	@Override
	public List<Invoice> findAllWithOrders(String username) {
		return invoiceRepository.findAllWithOrders(username);
	}

	@Override
	public Invoice findById(int id) {
		return invoiceRepository.findById(id).get();
	}

	@Override
	public List<Invoice> findAllWithOrders() {
		return invoiceRepository.findAllWithOrders();
	}

	@Override
	public Long countNewInvoice(String status) {
		return invoiceRepository.countNewInvoice(status);
	}

}
