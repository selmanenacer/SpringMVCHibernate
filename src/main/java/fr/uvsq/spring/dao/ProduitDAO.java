package fr.uvsq.spring.dao;

import java.util.List;

import fr.uvsq.spring.model.Produit;

public interface ProduitDAO extends HomeDAO<Produit>{
	
	public List<String> getListConstructeurs();

}
