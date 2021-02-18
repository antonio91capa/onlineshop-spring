package net.antonio.app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.antonio.app.model.InvoiceDetails;
import net.antonio.app.repositories.InvoiceDetailsRepository;

@Service("invoiceDetailsService")
@Transactional
public class InvoiceDetailsServiceImpl implements InvoiceDetailsService {

	@Autowired
	private InvoiceDetailsRepository invoiceDetailsRepository;

	@Override
	public InvoiceDetails save(InvoiceDetails invoiceDetails) {
		return invoiceDetailsRepository.save(invoiceDetails);
	}

}
