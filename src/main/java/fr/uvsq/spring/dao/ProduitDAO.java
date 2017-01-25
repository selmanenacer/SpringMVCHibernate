package fr.uvsq.spring.dao;

import java.util.List;


import fr.uvsq.spring.model.Produit;

public interface ProduitDAO {
	
	Produit findById(int id);
	List<Produit> findAll();
	void insert(Produit nouveau);
	void update(Produit nouveau);
	void delete(int id);

}
