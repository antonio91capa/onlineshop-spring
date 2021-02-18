package net.antonio.app.services;

import java.util.List;

import net.antonio.app.model.Slide;

public interface SlideService {

	public Iterable<Slide> findAll();

	public Slide save(Slide slide);

	public void delete(int id);

	public Slide find(int id);

	public List<Slide> findAllWithStatus(boolean status);

}
