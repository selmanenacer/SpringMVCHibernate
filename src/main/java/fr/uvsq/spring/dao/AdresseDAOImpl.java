package fr.uvsq.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import fr.uvsq.spring.model.Adresse;

@Repository
public class AdresseDAOImpl  implements AdresseDAO {

	private static final Logger logger = LoggerFactory.getLogger(PersonDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public Adresse findById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Adresse p = (Adresse) session.load(Adresse.class, new Integer(id));
		logger.info("Adress loaded successfully, Adress details="+p);
		return p;
	}

	@Override
	public List<Adresse> findAll() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Adresse> adressesList = session.createQuery("from Adresse").list();
		for(Adresse p : adressesList){
			logger.info("Adresse List::"+p);
		}
		return adressesList;
	}

	@Override
	public void insert(Adresse nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(nouveau);
		logger.info("Adress saved successfully, Adress Details="+nouveau);
	}

	@Override
	public void update(Adresse nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(nouveau);
		logger.info("Adress updated successfully, Adress Details="+nouveau);
	}

	@Override
	public void delete(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Adresse p = (Adresse) session.load(Adresse.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Adress deleted successfully, Adresse details="+p);
	}
	
	
	

	/*
	public List<Adresse> findAll(String query) {
		List<Adresse> list = new ArrayList<Adresse>();
		list = getHibernateTemplate().find(query) ;
		System.out.println("hdtttttttttttttttttttttttt"+list.size());
		Adresse adr = new Adresse();
		adr.setRue("22");
		adr.setVille("izan");
		list.add(adr);
		return list;
	}
	*/

}
