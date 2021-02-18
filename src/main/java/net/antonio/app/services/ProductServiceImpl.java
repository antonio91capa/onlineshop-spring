package net.antonio.app.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.antonio.app.model.Product;
import net.antonio.app.repositories.ProductRepository;

@Service("productService")
@Transactional
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;

	@Override
	public Iterable<Product> findAll() {
		return productRepository.findAll();
	}

	@Override
	public Product save(Product product) {
		return productRepository.save(product);
	}

	@Override
	public void delete(int id) {
		productRepository.deleteById(id);
	}

	@Override
	public Product find(int id) {
		return productRepository.findById(id).get();
	}

	@Override
	public List<Product> latestProducts(boolean status, int n) {
		return productRepository.latestProducts(status, n);
	}

	@Override
	public List<Product> featuredProducts(boolean status, boolean featured, int n) {
		return productRepository.featuredProducts(status, featured, n);
	}

	@Override
	public List<Product> relatedProducts(boolean status, int categoryId, int id, int n) {
		return productRepository.relatedProducts(status, categoryId, id, n);
	}

	@Override
	public List<Product> searchAllProducts(boolean status, String keyword) {
		return productRepository.searchAllProducts(status, keyword);
	}

	@Override
	public List<Product> searchProductsByCategory(boolean status, String keyword, int category) {
		return productRepository.searchProductsByCategory(status, keyword, category);
	}

	@Override
	public Long count() {
		return productRepository.count();
	}

	

}
