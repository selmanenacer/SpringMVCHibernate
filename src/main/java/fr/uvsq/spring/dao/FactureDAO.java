package fr.uvsq.spring.dao;

import java.util.List;

import fr.uvsq.spring.model.Facture;

public interface FactureDAO extends HomeDAO<Facture>{
	
	Facture findById(int id);
	List<Facture> findAll();
	void insert(Facture nouveau);
	void update(Facture nouveau);
	void delete(int id);
	

}
