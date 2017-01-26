package fr.uvsq.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import fr.uvsq.spring.model.Facture;

@Repository
public class FactureDAOImpl  implements FactureDAO {

	private static final Logger logger = LoggerFactory.getLogger(FactureDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public Facture findById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Facture p = (Facture) session.load(Facture.class, new Integer(id));
		logger.info("Facture loaded successfully, Facture details="+p);
		return p;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Facture> findAll() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Facture> facturesList = session.createQuery("from Facture").list();
		for(Facture p : facturesList){
			logger.info("Adresse List::"+p);
		}
		return facturesList;
	}

	@Override
	public void insert(Facture nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(nouveau);
		logger.info("Facture saved successfully, Facture Details="+nouveau);
	}

	@Override
	public void update(Facture nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(nouveau);
		logger.info("Facture updated successfully, Facture Details="+nouveau);
	}

	@Override
	public void delete(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Facture p = (Facture) session.load(Facture.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Facture deleted successfully, Facture details="+p);
	}
	
}
