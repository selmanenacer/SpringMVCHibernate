package fr.uvsq.spring.dao;

import java.awt.Image;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import fr.uvsq.spring.model.ImageBlob;

@Repository
public class ImageBlobDAOImpl  implements ImageBlobDAO {

	private static final Logger logger = LoggerFactory.getLogger(ImageBlobDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public ImageBlob findById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		ImageBlob p = (ImageBlob) session.load(ImageBlob.class, new Integer(id));
		logger.info("Image loaded successfully, Image details="+p);
		return p;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ImageBlob> findAll() {
		Session session = this.sessionFactory.getCurrentSession();
		List<ImageBlob> imagesList = session.createQuery("from ImageBlob").list();
		for(ImageBlob p : imagesList){
			logger.info("Images List::"+p);
		}
		return imagesList;
	}

	@Override
	public void insert(ImageBlob nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(nouveau);
		logger.info("Image saved successfully, Image Details="+nouveau);
	}

	@Override
	public void update(ImageBlob nouveau) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(nouveau);
		logger.info("Image updated successfully, Image Details="+nouveau);
	}

	@Override
	public void delete(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		ImageBlob p = (ImageBlob) session.load(ImageBlob.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Image deleted successfully, Image details="+p);
	}
	
	/**
     * Vide la table IMAGE_BLOB.
     */
    public void purgerImageBlob() {
    	Session session = this.sessionFactory.getCurrentSession();
    	session.createQuery("delete from "+ImageBlob.class.getCanonicalName()).executeUpdate();
    }

    /**
     * Cette méthode lit une image depuis un champ Blob.
     */
    public void lireImageBlob(int pId, File pFile) throws IOException {
    	Session session = this.sessionFactory.getCurrentSession();
        logger.info("Lecture de l'image");
        final ImageBlob lImageBlobFromBase = (ImageBlob) session.get(ImageBlob.class, pId);
        logger.info("- Id : "+lImageBlobFromBase.getId());
        logger.info("- Libelle : "+lImageBlobFromBase.getLibelle());
        ImageIO.write((RenderedImage) lImageBlobFromBase.getImage(), "png", pFile);
    }

    /**
     * Cette méthode insère une image dans un champ Blob.
     */
    public void insererImageBlob(String pLibelle, File pFile) throws IOException {

    	Session session = this.sessionFactory.getCurrentSession();
        logger.info("Insertion de l'image");
        final Image lImageHibernate = ImageIO.read(pFile);
        final ImageBlob lImageBlob = new ImageBlob();
        lImageBlob.setLibelle(pLibelle);
        lImageBlob.setImage(lImageHibernate);
        session.save(lImageBlob);
    }

    /**
     * Cette méthode modifie une image dans un champ Blob.
     */
    public void modifierImageBlob(int pId, String pLibelle, File pFile) throws IOException {

    	Session session = this.sessionFactory.getCurrentSession();
        logger.info("Modification de l'image");
        final Image lImageHibernate = ImageIO.read(pFile);
        final ImageBlob lImageBlob = new ImageBlob();
        lImageBlob.setId(pId);
        lImageBlob.setLibelle(pLibelle);
        lImageBlob.setImage(lImageHibernate);
        session.update(lImageBlob);
    }

}
