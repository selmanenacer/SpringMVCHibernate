package fr.uvsq.spring.service;

import java.util.List;

import fr.uvsq.spring.model.Commande;

public interface CommandeService extends HomeService<Commande>{
	
	Commande findById(int id);
	List<Commande> findAll();
	void insert(Commande nouveau);
	void update(Commande nouveau);
	void delete(int id);
}
