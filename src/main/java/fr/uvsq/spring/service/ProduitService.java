package fr.uvsq.spring.service;

import java.util.List;

import fr.uvsq.spring.model.Produit;

public interface ProduitService extends HomeService<Produit>{
	
	Produit findById(int id);
	List<Produit> findAll();
	void insert(Produit nouveau);
	void update(Produit nouveau);
	void delete(int id);

}
