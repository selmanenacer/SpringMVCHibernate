package fr.uvsq.spring.dao;

import java.util.List;

import fr.uvsq.spring.model.LignePanier;

public interface LignePanierDAO extends HomeDAO<LignePanier>{
	
	LignePanier findById(int id);
	List<LignePanier> findAll();
	void insert(LignePanier nouveau);
	void update(LignePanier nouveau);
	void delete(int id);
	

}
