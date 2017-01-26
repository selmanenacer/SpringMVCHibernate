package fr.uvsq.spring.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import fr.uvsq.spring.dao.CommandeDAO;
import fr.uvsq.spring.model.Commande;


public class CommandeServiceImpl implements CommandeService{
	
	private CommandeDAO commandeDAO;

	public void setCommandeDAO(CommandeDAO commandeDAO) {
		this.commandeDAO = commandeDAO;
	}

	@Override
	@Transactional
	public Commande findById(int id) {
		return commandeDAO.findById(id);
	}

	@Override
	@Transactional
	public List<Commande> findAll() {
		return commandeDAO.findAll();
	}

	@Override
	@Transactional
	public void insert(Commande nouveau) {
		this.commandeDAO.insert(nouveau);	
	}

	@Override
	@Transactional
	public void update(Commande nouveau) {
		this.commandeDAO.update(nouveau);
	}

	@Override
	@Transactional
	public void delete(int id) {
		this.commandeDAO.delete(id);
	}

}
