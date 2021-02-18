package net.antonio.app.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import net.antonio.app.model.InvoiceDetails;

@Repository("invoiceDetailsRepository")
public interface InvoiceDetailsRepository extends CrudRepository<InvoiceDetails, Integer> {

}
