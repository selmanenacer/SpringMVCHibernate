package fr.uvsq.spring.service;

import java.util.List;

import fr.uvsq.spring.model.Produit;

public interface ProduitService extends HomeService<Produit>{
	public List<String> getListConstructeurs();
}
