package fr.uvsq.spring.service;

import fr.uvsq.spring.model.Client;

public interface ClientService extends HomeService<Client>{

	Client isValidClient(String email , String psw);
}
