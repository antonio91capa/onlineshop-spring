package net.antonio.app.model;
// Generated 13/11/2019 10:17:22 PM by Hibernate Tools 4.3.1

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * InvoiceDetails generated by hbm2java
 */
@Entity
@Table(name = "invoice_details")
public class InvoiceDetails implements java.io.Serializable {

	private InvoiceDetailsId id;
	private Invoice invoice;
	private Product product;
	private double price;
	private int quantity;

	public InvoiceDetails() {
	}

	public InvoiceDetails(InvoiceDetailsId id, Invoice invoice, Product product, double price, int quantity) {
		this.id = id;
		this.invoice = invoice;
		this.product = product;
		this.price = price;
		this.quantity = quantity;
	}

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "invoiceId", column = @Column(name = "invoice_id", nullable = false)),
			@AttributeOverride(name = "productId", column = @Column(name = "product_id", nullable = false)) })
	public InvoiceDetailsId getId() {
		return this.id;
	}

	public void setId(InvoiceDetailsId id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "invoice_id", nullable = false, insertable = false, updatable = false)
	public Invoice getInvoice() {
		return this.invoice;
	}

	public void setInvoice(Invoice invoice) {
		this.invoice = invoice;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_id", nullable = false, insertable = false, updatable = false)
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Column(name = "price", nullable = false, precision = 22, scale = 0)
	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Column(name = "quantity", nullable = false)
	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
