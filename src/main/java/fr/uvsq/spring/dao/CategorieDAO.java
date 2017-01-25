package fr.uvsq.spring.dao;

import java.util.List;

import fr.uvsq.spring.model.Categorie;


public interface CategorieDAO {
	
	Categorie findById(int id);
	List<Categorie> findAll();
	void insert(Categorie nouveau);
	void update(Categorie nouveau);
	void delete(int id);

}
