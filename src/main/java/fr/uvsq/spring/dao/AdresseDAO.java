package fr.uvsq.spring.dao;

import java.util.List;

import fr.uvsq.spring.model.Adresse;

public interface AdresseDAO {
	
	Adresse findById(int id);
	List<Adresse> findAll();
	void insert(Adresse nouveau);
	void update(Adresse nouveau);
	void delete(int id);
	

}
