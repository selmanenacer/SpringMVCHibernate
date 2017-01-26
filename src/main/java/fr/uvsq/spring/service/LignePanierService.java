package fr.uvsq.spring.service;

import java.util.List;

import fr.uvsq.spring.model.LignePanier;

public interface LignePanierService extends HomeService<LignePanier>{
	
	LignePanier findById(int id);
	List<LignePanier> findAll();
	void insert(LignePanier nouveau);
	void update(LignePanier nouveau);
	void delete(int id);
}
