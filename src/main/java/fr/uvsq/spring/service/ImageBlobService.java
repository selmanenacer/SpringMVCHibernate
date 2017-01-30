package fr.uvsq.spring.service;

import java.io.File;
import java.io.IOException;

import fr.uvsq.spring.model.ImageBlob;

public interface ImageBlobService extends HomeService<ImageBlob>{
	public void purgerImageBlob();
	public void lireImageBlob(int pId, File pFile) throws IOException;
	public void insererImageBlob(String pLibelle, File pFile) throws IOException;
	public void modifierImageBlob(int pId, String pLibelle, File pFile) throws IOException;
	
}
