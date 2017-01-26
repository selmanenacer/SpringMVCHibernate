package fr.uvsq.spring.service;

import java.util.List;

import fr.uvsq.spring.model.Facture;

public interface FactureService extends HomeService<Facture>{
	
	Facture findById(int id);
	List<Facture> findAll();
	void insert(Facture nouveau);
	void update(Facture nouveau);
	void delete(int id);
}
