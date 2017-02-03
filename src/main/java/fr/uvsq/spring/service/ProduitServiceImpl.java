package fr.uvsq.spring.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import fr.uvsq.spring.dao.ProduitDAO;
import fr.uvsq.spring.model.Produit;

public class ProduitServiceImpl implements ProduitService{

	private ProduitDAO produitDAO;

	public void setProduitDAO(ProduitDAO produitDAO) {
		this.produitDAO = produitDAO;
	}

	@Override
	@Transactional
	public Produit findById(int id) {
		
		return produitDAO.findById(id);
	}

	@Override
	@Transactional
	public List<Produit> findAll() {
		return produitDAO.findAll();
	}

	@Override
	@Transactional
	public void insert(Produit nouveau) {
		produitDAO.insert(nouveau);

	}

	@Override
	@Transactional
	public void update(Produit nouveau) {
		produitDAO.update(nouveau);

	}

	@Override
	@Transactional
	public void delete(int id) {
		produitDAO.delete(id);

	}

	@Override
	@Transactional
	public List<String> getListConstructeurs() {
		return produitDAO.getListConstructeurs();
	}

}
