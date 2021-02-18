package net.antonio.app.services;

import java.util.List;

import net.antonio.app.model.Category;

public interface CategoryService {
	
	public Iterable<Category> findAll();

	public List<Category> findParentCategories();
	
	public Category save(Category category);
	
	public void delete(int id);
	
	public Category findById(int id);
	
	public List<Category> findParentCategoriesWithStatus(boolean status);

}
