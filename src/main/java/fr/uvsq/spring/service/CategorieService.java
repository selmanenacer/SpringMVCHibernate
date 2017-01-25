package fr.uvsq.spring.service;

import java.util.List;

import fr.uvsq.spring.model.Categorie;

public interface CategorieService {
	
	Categorie findById(int id);
	List<Categorie> findAll();
	void insert(Categorie nouveau);
	void update(Categorie nouveau);
	void delete(int id);


}
