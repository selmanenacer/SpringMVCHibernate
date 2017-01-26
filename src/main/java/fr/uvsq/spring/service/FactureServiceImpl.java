package fr.uvsq.spring.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import fr.uvsq.spring.dao.FactureDAO;
import fr.uvsq.spring.model.Facture;

public class FactureServiceImpl implements FactureService{
	
	private FactureDAO factureDAO;

	public void setFactureDAO(FactureDAO factureDAO) {
		this.factureDAO = factureDAO;
	}

	@Override
	@Transactional
	public Facture findById(int id) {
		return factureDAO.findById(id);
	}

	@Override
	@Transactional
	public List<Facture> findAll() {
		return factureDAO.findAll();
	}

	@Override
	@Transactional
	public void insert(Facture nouveau) {
		this.factureDAO.insert(nouveau);	
	}

	@Override
	@Transactional
	public void update(Facture nouveau) {
		this.factureDAO.update(nouveau);
	}

	@Override
	@Transactional
	public void delete(int id) {
		this.factureDAO.delete(id);
	}

}
