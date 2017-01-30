package fr.uvsq.spring.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import fr.uvsq.spring.dao.ImageBlobDAO;
import fr.uvsq.spring.model.ImageBlob;

public class ImageBlobServiceImpl implements ImageBlobService{
	
	private ImageBlobDAO imageBlobDAO;

	public void setImageBlobDAO(ImageBlobDAO imageBlobDAO) {
		this.imageBlobDAO = imageBlobDAO;
	}

	@Override
	@Transactional
	public ImageBlob findById(int id) {
		return imageBlobDAO.findById(id);
	}

	@Override
	@Transactional
	public List<ImageBlob> findAll() {
		return imageBlobDAO.findAll();
	}

	@Override
	@Transactional
	public void insert(ImageBlob nouveau) {
		this.imageBlobDAO.insert(nouveau);	
	}

	@Override
	@Transactional
	public void update(ImageBlob nouveau) {
		this.imageBlobDAO.update(nouveau);
	}

	@Override
	@Transactional
	public void delete(int id) {
		this.imageBlobDAO.delete(id);
	}

	@Override
	@Transactional
	public void purgerImageBlob() {
		this.imageBlobDAO.purgerImageBlob();
		
	}

	@Override
	@Transactional
	public void lireImageBlob(int pId, File pFile) throws IOException {
		this.imageBlobDAO.lireImageBlob(pId, pFile);
		
	}

	@Override
	@Transactional
	public void insererImageBlob(String pLibelle, File pFile) throws IOException {
		this.imageBlobDAO.insererImageBlob(pLibelle, pFile);
		
	}

	@Override
	@Transactional
	public void modifierImageBlob(int pId, String pLibelle, File pFile) throws IOException {
		this.imageBlobDAO.modifierImageBlob(pId, pLibelle, pFile);
		
	}
	
	

}
