package fr.uvsq.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import fr.uvsq.spring.model.LignePanier;

@Repository
public class LignePanierDAOImpl  implements LignePanierDAO {

	private static final Logger logger = LoggerFactory.getLogger(LignePanierDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public LignePanier findById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		LignePanier p = (LignePanier) session.load(LignePanier.class, new Integer(id));
		logger.info("LignePanier loaded successfully, LignePanier details="+p);
		return p;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LignePanier> findAll() {
		Session session = this.sessionFactory.getCurrentSession();
		List<LignePanier> lignesPanierList = session.createQuery("from LignePanier").list();
		for(LignePanier p : lignesPanierList){
			logger.info("LignePanier List::"+p);
		}
		return lignesPanierList;
	}

	@Override
	public void insert(LignePanier nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(nouveau);
		logger.info("LignePanier saved successfully, LignePanier Details="+nouveau);
	}

	@Override
	public void update(LignePanier nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(nouveau);
		logger.info("LignePanier updated successfully, LignePanier Details="+nouveau);
	}

	@Override
	public void delete(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		LignePanier p = (LignePanier) session.load(LignePanier.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("LignePanier deleted successfully, LignePanier details="+p);
	}

}
