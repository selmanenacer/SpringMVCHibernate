package fr.uvsq.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import fr.uvsq.spring.model.LigneCommande;

@Repository
public class LigneCommandeDAOImpl  implements LigneCommandeDAO {

	private static final Logger logger = LoggerFactory.getLogger(LigneCommandeDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public LigneCommande findById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		LigneCommande p = (LigneCommande) session.load(LigneCommande.class, new Integer(id));
		logger.info("LigneCommande loaded successfully, LigneCommande details="+p);
		return p;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LigneCommande> findAll() {
		Session session = this.sessionFactory.getCurrentSession();
		List<LigneCommande> lignesCommandeList = session.createQuery("from LigneCommande").list();
		for(LigneCommande p : lignesCommandeList){
			logger.info("LigneCommande List::"+p);
		}
		return lignesCommandeList;
	}

	@Override
	public void insert(LigneCommande nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(nouveau);
		logger.info("LigneCommande saved successfully, LigneCommande Details="+nouveau);
	}

	@Override
	public void update(LigneCommande nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(nouveau);
		logger.info("LigneCommande updated successfully, LigneCommande Details="+nouveau);
	}

	@Override
	public void delete(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		LigneCommande p = (LigneCommande) session.load(LigneCommande.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("LigneCommande deleted successfully, LigneCommande details="+p);
	}

}
