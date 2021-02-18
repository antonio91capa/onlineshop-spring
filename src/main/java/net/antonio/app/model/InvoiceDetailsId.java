package net.antonio.app.model;
// Generated 13/11/2019 10:17:22 PM by Hibernate Tools 4.3.1

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * InvoiceDetailsId generated by hbm2java
 */
@Embeddable
public class InvoiceDetailsId implements java.io.Serializable {

	private int invoiceId;
	private int productId;

	public InvoiceDetailsId() {
	}

	public InvoiceDetailsId(int invoiceId, int productId) {
		this.invoiceId = invoiceId;
		this.productId = productId;
	}

	@Column(name = "invoice_id", nullable = false)
	public int getInvoiceId() {
		return this.invoiceId;
	}

	public void setInvoiceId(int invoiceId) {
		this.invoiceId = invoiceId;
	}

	@Column(name = "product_id", nullable = false)
	public int getProductId() {
		return this.productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof InvoiceDetailsId))
			return false;
		InvoiceDetailsId castOther = (InvoiceDetailsId) other;

		return (this.getInvoiceId() == castOther.getInvoiceId()) && (this.getProductId() == castOther.getProductId());
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getInvoiceId();
		result = 37 * result + this.getProductId();
		return result;
	}

}
