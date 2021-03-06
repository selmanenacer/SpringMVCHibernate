package fr.uvsq.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import fr.uvsq.spring.model.Categorie;


@Repository
public class CategorieDAOImpl implements CategorieDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(CategorieDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public Categorie findById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Categorie categorie = (Categorie) session.load(Categorie.class, new Integer(id));
		logger.info("Categorie loaded successfully, Categorie details="+categorie);
		return categorie;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Categorie> findAll() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Categorie> cList = session.createQuery("from Categorie").list();
		for(Categorie categorie : cList){
			logger.info("Client List::"+categorie);
		}
		return cList;
	}

	@Override
	public void insert(Categorie nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(nouveau);
		logger.info("Categorie saved successfully, Categorie Details="+nouveau);
		
	}

	@Override
	public void update(Categorie nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(nouveau);
		logger.info("Categorie updated successfully, Categorie Details="+nouveau);
	}

	@Override
	public void delete(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Categorie categorie = (Categorie) session.load(Categorie.class, new Integer(id));
		if(null != categorie){
			session.delete(categorie);
		}
		logger.info("Categorie deleted successfully, Categorie details="+categorie);
		
	}
	

}
