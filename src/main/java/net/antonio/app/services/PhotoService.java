package net.antonio.app.services;

import net.antonio.app.model.Photo;

public interface PhotoService {
	
	public Photo save(Photo photo);
	
	public void delete(int id);
	
	public Photo find(int id);

}
