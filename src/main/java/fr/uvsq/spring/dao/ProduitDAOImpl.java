package fr.uvsq.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


import fr.uvsq.spring.model.Produit;

@Repository
public class ProduitDAOImpl implements ProduitDAO{

	private static final Logger logger = LoggerFactory.getLogger(ProduitDAOImpl.class);
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public Produit findById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Produit produit = (Produit) session.load(Produit.class, new Integer(id));
		logger.info("Customer loaded successfully, Customer details="+produit);
		return produit;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Produit> findAll() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Produit> prList = session.createQuery("from Produit").list();
		for(Produit p : prList){
			logger.info("Client List::"+p);
		}
		return prList;
	}

	@Override
	public void insert(Produit nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(nouveau);
		logger.info("Person saved successfully, Person Details="+nouveau);
	}

	@Override
	public void update(Produit nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(nouveau);
		logger.info("Customer updated successfully, Customer Details="+nouveau);

	}

	@Override
	public void delete(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Produit produit = (Produit) session.load(Produit.class, new Integer(id));
		if(null != produit){
			session.delete(produit);
		}
		logger.info("Customer deleted successfully, Customer details="+produit);
	}

	}


