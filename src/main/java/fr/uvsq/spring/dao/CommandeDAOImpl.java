package fr.uvsq.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import fr.uvsq.spring.model.Commande;

@Repository
public class CommandeDAOImpl  implements CommandeDAO {

	private static final Logger logger = LoggerFactory.getLogger(CommandeDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public Commande findById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Commande p = (Commande) session.load(Commande.class, new Integer(id));
		logger.info("Commande loaded successfully, Commande details="+p);
		return p;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Commande> findAll() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Commande> commandesList = session.createQuery("from Commande").list();
		for(Commande p : commandesList){
			logger.info("Commande List::"+p);
		}
		return commandesList;
	}

	@Override
	public void insert(Commande nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(nouveau);
		logger.info("Commande saved successfully, Commande Details="+nouveau);
	}

	@Override
	public void update(Commande nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(nouveau);
		logger.info("Commande updated successfully, Commande Details="+nouveau);
	}

	@Override
	public void delete(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Commande p = (Commande) session.load(Commande.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Commande deleted successfully, Commande details="+p);
	}

}
