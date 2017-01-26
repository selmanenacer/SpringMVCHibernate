package fr.uvsq.spring.dao;

import java.util.List;

import fr.uvsq.spring.model.Client;

public interface ClientDAO extends HomeDAO<Client>{
	
	Client findById(int id);
	List<Client> findAll();
	void insert(Client nouveau);
	void update(Client nouveau);
	void delete(int id);

}
