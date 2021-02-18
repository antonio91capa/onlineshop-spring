package net.antonio.app.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import net.antonio.app.model.Invoice;

@Repository("invoiceRepository")
public interface InvoiceRepository extends CrudRepository<Invoice, Integer> {

	@Query("from Invoice where account.username= :username order by id desc")
	public List<Invoice> findAllWithOrders(@Param("username") String username);

	@Query("from Invoice order by id desc")
	public List<Invoice> findAllWithOrders();

	@Query("select count(id) from Invoice where status = :status")
	public Long countNewInvoice(@Param("status") String status);

}
