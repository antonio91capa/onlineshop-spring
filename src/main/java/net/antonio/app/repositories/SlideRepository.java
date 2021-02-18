package net.antonio.app.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import net.antonio.app.model.Slide;

@Repository("slideRepository")
public interface SlideRepository extends CrudRepository<Slide, Integer> {

	@Query("from Slide where status= :status")
	public List<Slide> findAllWithStatus(@Param("status") boolean status);

}
