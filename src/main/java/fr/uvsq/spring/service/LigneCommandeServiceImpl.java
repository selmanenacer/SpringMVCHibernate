package fr.uvsq.spring.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import fr.uvsq.spring.dao.LigneCommandeDAO;
import fr.uvsq.spring.model.LigneCommande;

public class LigneCommandeServiceImpl implements LigneCommandeService{
	
	private LigneCommandeDAO ligneCommandeDAO;

	public void setLigneCommandeDAO(LigneCommandeDAO ligneCommandeDAO) {
		this.ligneCommandeDAO = ligneCommandeDAO;
	}

	@Override
	@Transactional
	public LigneCommande findById(int id) {
		return ligneCommandeDAO.findById(id);
	}

	@Override
	@Transactional
	public List<LigneCommande> findAll() {
		return ligneCommandeDAO.findAll();
	}

	@Override
	@Transactional
	public void insert(LigneCommande nouveau) {
		this.ligneCommandeDAO.insert(nouveau);	
	}

	@Override
	@Transactional
	public void update(LigneCommande nouveau) {
		this.ligneCommandeDAO.update(nouveau);
	}

	@Override
	@Transactional
	public void delete(int id) {
		this.ligneCommandeDAO.delete(id);
	}

}
