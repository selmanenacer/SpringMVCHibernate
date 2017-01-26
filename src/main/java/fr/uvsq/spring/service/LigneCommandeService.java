package fr.uvsq.spring.service;

import java.util.List;

import fr.uvsq.spring.model.LigneCommande;

public interface LigneCommandeService extends HomeService<LigneCommande>{
	
	LigneCommande findById(int id);
	List<LigneCommande> findAll();
	void insert(LigneCommande nouveau);
	void update(LigneCommande nouveau);
	void delete(int id);
}
