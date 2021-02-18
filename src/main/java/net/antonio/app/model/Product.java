package net.antonio.app.model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Category category;
	private String name;
	private double price;
	private int quantity;
	private String descripcion;
	private String details;
	private boolean status;
	private boolean featured;
	private List<Photo> photos = new ArrayList<Photo>(0);
	private List<InvoiceDetails> invoiceDetailses = new ArrayList<InvoiceDetails>(0);

	public Product() {
	}

	public Product(Category category, String name, double price, int quantity, String descripcion, String details,
			boolean status, boolean featured) {
		this.category = category;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.descripcion = descripcion;
		this.details = details;
		this.status = status;
		this.featured = featured;
	}

	public Product(Category category, String name, double price, int quantity, String descripcion, String details,
			boolean status, boolean featured, List<Photo> photos, List<InvoiceDetails> invoiceDetailses) {
		this.category = category;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.descripcion = descripcion;
		this.details = details;
		this.status = status;
		this.featured = featured;
		this.photos = photos;
		this.invoiceDetailses = invoiceDetailses;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id", nullable = false)
	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Column(name = "name", nullable = false, length = 250)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
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

	@Column(name = "descripcion", nullable = false, length = 65535)
	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@Column(name = "details", nullable = false, length = 65535)
	public String getDetails() {
		return this.details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Column(name = "featured", nullable = false)
	public boolean isFeatured() {
		return this.featured;
	}

	public void setFeatured(boolean featured) {
		this.featured = featured;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public List<Photo> getPhotos() {
		return this.photos;
	}

	public void setPhotos(List<Photo> photos) {
		this.photos = photos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public List<InvoiceDetails> getInvoiceDetailses() {
		return this.invoiceDetailses;
	}

	public void setInvoiceDetailses(List<InvoiceDetails> invoiceDetailses) {
		this.invoiceDetailses = invoiceDetailses;
	}

}
