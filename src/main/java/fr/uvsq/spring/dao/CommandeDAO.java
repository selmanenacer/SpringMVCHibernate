package fr.uvsq.spring.dao;

import java.util.List;

import fr.uvsq.spring.model.Commande;

public interface CommandeDAO extends HomeDAO<Commande>{
	
	Commande findById(int id);
	List<Commande> findAll();
	void insert(Commande nouveau);
	void update(Commande nouveau);
	void delete(int id);
	

}
