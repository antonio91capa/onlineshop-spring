package net.antonio.app.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import net.antonio.app.model.Product;

@Repository("productRepository")
public interface ProductRepository extends CrudRepository<Product, Integer>{

	@Query(value="select * from product where status = :status order by id desc limit :n", nativeQuery=true)
	public List<Product> latestProducts(@Param("status") boolean status, @Param("n") int n);
	
	@Query(value="select * from product where status = :status and featured = :featured order by id desc limit :n", nativeQuery=true)
	public List<Product> featuredProducts(@Param("status") boolean status, @Param("featured") boolean featured, @Param("n") int n);
	
	@Query(value="select * from product where status = :status and category_id = :category_id and id != :id limit :n", nativeQuery=true)
	public List<Product> relatedProducts(@Param("status") boolean status, @Param("category_id") int categoryId, @Param("id") int id, @Param("n") int n);
	
	@Query(value="select * from product where status= :status and name like %:keyword%", nativeQuery=true)
	public List<Product> searchAllProducts(@Param("status") boolean status, @Param("keyword") String keyword);
	
	@Query(value="select * from product where status= :status and name like %:keyword% and category_id = :category_id", nativeQuery=true)
	public List<Product> searchProductsByCategory(@Param("status") boolean status, @Param("keyword") String keyword, @Param("category_id") int category_id);
}
