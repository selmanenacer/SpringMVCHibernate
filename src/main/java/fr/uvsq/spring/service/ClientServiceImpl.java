package fr.uvsq.spring.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import fr.uvsq.spring.model.Client;
import fr.uvsq.spring.dao.ClientDAO;;

public class ClientServiceImpl implements ClientService {
	
	private ClientDAO clientDAO ;
	

	public void setClientDAO(ClientDAO clientDao) {
		this.clientDAO = clientDao;
	}

	@Override
	@Transactional
	public Client findById(int id) {
		
		return clientDAO.findById(id);
	}

	@Override
	@Transactional
	public List<Client> findAll() {
		
		return clientDAO.findAll();
	}

	@Override
	@Transactional
	public void insert(Client nouveau) {
		this.clientDAO.insert(nouveau);
		
	}

	@Override
	@Transactional
	public void update(Client nouveau) {
		this.clientDAO.update(nouveau);
		
	}

	@Override
	@Transactional
	public void delete(int id) {
		
		this.clientDAO.delete(id);
		
	}

	@Override
	@Transactional
	public Client isValidClient(String email, String psw) {
		
		return clientDAO.isValidClient(email, psw);
	}

}
