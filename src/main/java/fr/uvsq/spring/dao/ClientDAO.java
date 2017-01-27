package fr.uvsq.spring.dao;

import fr.uvsq.spring.model.Client;

public interface ClientDAO extends HomeDAO<Client>{

	Client isValidClient(String email , String psw);
	boolean clientExist(String email);

}
