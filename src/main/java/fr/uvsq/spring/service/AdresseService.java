package fr.uvsq.spring.service;

import java.util.List;

import fr.uvsq.spring.model.Adresse;

public interface AdresseService {
	
	Adresse findById(int id);
	List<Adresse> findAll();
	void insert(Adresse nouveau);
	void update(Adresse nouveau);
	void delete(int id);
}
