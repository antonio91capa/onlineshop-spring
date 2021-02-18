package net.antonio.app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.antonio.app.model.Photo;
import net.antonio.app.repositories.PhotoRepository;

@Service("photoService")
@Transactional
public class PhotoServiceImpl implements PhotoService {

	@Autowired
	private PhotoRepository photoRepository;

	@Override
	public Photo save(Photo photo) {
		return photoRepository.save(photo);
	}

	@Override
	public void delete(int id) {
		photoRepository.deleteById(id);
	}

	@Override
	public Photo find(int id) {
		return photoRepository.findById(id).get();
	}

}
