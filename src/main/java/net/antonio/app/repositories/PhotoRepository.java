package net.antonio.app.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import net.antonio.app.model.Photo;

@Repository("photoRepository")
public interface PhotoRepository extends CrudRepository<Photo, Integer> {

}
