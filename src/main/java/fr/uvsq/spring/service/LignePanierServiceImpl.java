package fr.uvsq.spring.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import fr.uvsq.spring.dao.LignePanierDAO;
import fr.uvsq.spring.model.LignePanier;

public class LignePanierServiceImpl implements LignePanierService{
	
	private LignePanierDAO lignePanierDAO;

	public void setLignePanierDAO(LignePanierDAO lignePanierDAO) {
		this.lignePanierDAO = lignePanierDAO;
	}

	@Override
	@Transactional
	public LignePanier findById(int id) {
		return lignePanierDAO.findById(id);
	}

	@Override
	@Transactional
	public List<LignePanier> findAll() {
		return lignePanierDAO.findAll();
	}

	@Override
	@Transactional
	public void insert(LignePanier nouveau) {
		this.lignePanierDAO.insert(nouveau);	
	}

	@Override
	@Transactional
	public void update(LignePanier nouveau) {
		this.lignePanierDAO.update(nouveau);
	}

	@Override
	@Transactional
	public void delete(int id) {
		this.lignePanierDAO.delete(id);
	}

	@Override
	@Transactional
	public int existProductClient(int id_produit, int id_client) {
		// TODO Auto-generated method stub
		return this.lignePanierDAO.existProductClient(id_produit, id_client);
	}

}
