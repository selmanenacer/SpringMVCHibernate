package fr.uvsq.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


import fr.uvsq.spring.model.Client;

@Repository
public class ClientDAOImpl implements ClientDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(ClientDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public Client findById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Client p = (Client) session.load(Client.class, new Integer(id));
		logger.info("Customer loaded successfully, Customer details="+p);
		return p;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Client> findAll() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Client> clientsList = session.createQuery("from Client").list();
		for(Client p : clientsList){
			logger.info("Client List::"+p);
		}
		return clientsList;
	}

	@Override
	public void insert(Client nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		
		session.persist(nouveau);
		logger.info("Customer saved successfully, Customer Details="+nouveau);
	}

	@Override
	public void update(Client nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(nouveau);
		logger.info("Customer updated successfully, Customer Details="+nouveau);
	}

	@Override
	public void delete(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Client p = (Client) session.load(Client.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Customer deleted successfully, Customer details="+p);
	}

	@Override
	public Client isValidClient(String email, String psw) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Client where email = :eml and psw = :psw ");
		query.setParameter("eml", email);
		query.setParameter("psw", psw);
		List list = query.list();
		
		if (list.size()>0 ){
			return (Client) list.get(0);
		}
		return null;
	}

	@Override
	public boolean clientExist(String email) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Client where email = :eml  ");
		query.setParameter("eml", email);
		List list = query.list();
		if(list.size()>0){
			return true;
		}else{
			return false;
		}
		
	}
}
