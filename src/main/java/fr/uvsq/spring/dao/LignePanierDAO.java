package fr.uvsq.spring.dao;

import fr.uvsq.spring.model.LignePanier;

public interface LignePanierDAO extends HomeDAO<LignePanier>{
	public int existProductClient(int id_produit, int id_client);
}
