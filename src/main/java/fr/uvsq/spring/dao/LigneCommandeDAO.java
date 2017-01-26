package fr.uvsq.spring.dao;

import java.util.List;

import fr.uvsq.spring.model.LigneCommande;

public interface LigneCommandeDAO extends HomeDAO<LigneCommande>{
	
	LigneCommande findById(int id);
	List<LigneCommande> findAll();
	void insert(LigneCommande nouveau);
	void update(LigneCommande nouveau);
	void delete(int id);
	

}
