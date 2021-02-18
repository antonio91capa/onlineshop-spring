package net.antonio.app.services;

import java.util.List;

import net.antonio.app.model.Product;

public interface ProductService {
	
	public Iterable<Product> findAll();
	
	public Product save(Product product);
	
	public void delete(int id);
	
	public Product find(int id);
	
	public List<Product> latestProducts(boolean status, int n);
	
	public List<Product> featuredProducts(boolean status, boolean featured, int n);
	
	public List<Product> relatedProducts(boolean status, int categoryId, int id, int n);
	
	public List<Product> searchAllProducts(boolean status, String keyword);
	
	public List<Product> searchProductsByCategory(boolean status, String keyword, int category);
	
	public Long count();

}
