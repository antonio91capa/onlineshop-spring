package net.antonio.app.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.antonio.app.model.Slide;
import net.antonio.app.repositories.SlideRepository;

@Service("slideService")
@Transactional
public class SlideServiceImpl implements SlideService {

	@Autowired
	private SlideRepository slideRepository;

	@Override
	public Iterable<Slide> findAll() {
		return slideRepository.findAll();
	}

	@Override
	public Slide save(Slide slide) {
		return slideRepository.save(slide);
	}

	@Override
	public void delete(int id) {
		slideRepository.deleteById(id);
	}

	@Override
	public Slide find(int id) {
		return slideRepository.findById(id).get();
	}

	@Override
	public List<Slide> findAllWithStatus(boolean status) {
		return slideRepository.findAllWithStatus(status);
	}

}
