package fr.uvsq.spring.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import fr.uvsq.spring.dao.CategorieDAO;
import fr.uvsq.spring.model.Categorie;

public class CategorieServiceImpl implements CategorieService {

	private CategorieDAO categorieDAO ;
	
	public void setCategorieDAO(CategorieDAO categorieDAO) {
		this.categorieDAO = categorieDAO;
	}

	@Override
	@Transactional
	public Categorie findById(int id) {
		return categorieDAO.findById(id);
	}

	@Override
	@Transactional
	public List<Categorie> findAll() {
		return categorieDAO.findAll();
	}

	@Override
	@Transactional
	public void insert(Categorie nouveau) {
		categorieDAO.insert(nouveau);

	}

	@Override
	@Transactional
	public void update(Categorie nouveau) {
		categorieDAO.update(nouveau);

	}

	@Override
	@Transactional
	public void delete(int id) {
		categorieDAO.delete(id);

	}

}
