package fr.uvsq.spring.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import fr.uvsq.spring.dao.AdresseDAO;
import fr.uvsq.spring.model.Adresse;

public class AdresseServiceImpl implements AdresseService{
	
	private AdresseDAO adresseDAO;

	public void setAdresseDAO(AdresseDAO adresseDAO) {
		this.adresseDAO = adresseDAO;
	}

	@Override
	@Transactional
	public Adresse findById(int id) {
		return adresseDAO.findById(id);
	}

	@Override
	@Transactional
	public List<Adresse> findAll() {
		return adresseDAO.findAll();
	}

	@Override
	@Transactional
	public void insert(Adresse nouveau) {
		this.adresseDAO.insert(nouveau);	
	}

	@Override
	@Transactional
	public void update(Adresse nouveau) {
		this.adresseDAO.update(nouveau);
	}

	@Override
	@Transactional
	public void delete(int id) {
		this.adresseDAO.delete(id);
	}

}
