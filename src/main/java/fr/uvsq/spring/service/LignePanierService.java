package fr.uvsq.spring.service;

import fr.uvsq.spring.model.LignePanier;

public interface LignePanierService extends HomeService<LignePanier>{
	public int existProductClient(int id_produit, int id_client);
	
}
