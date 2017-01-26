package fr.uvsq.spring.dao;

import java.util.List;

public interface HomeDAO <T>{
	
	T findById(int id);
	List<T> findAll();
	void insert (T nouveau);
	void update(T nouveau);
	void delete(int id);
	
	
}
