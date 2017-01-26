package fr.uvsq.spring.service;

import java.util.List;

public interface HomeService<T> {
	
	T findById(int id);
	List<T> findAll();
	void insert (T nouveau);
	void update(T nouveau);
	void delete(int id);
	
}
