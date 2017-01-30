package fr.uvsq.spring.model;

import java.awt.Image;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

import fr.uvsq.spring.util.ImageBlobUserType;


@Entity
@TypeDefs(value={@TypeDef(name="imageBlob", typeClass=ImageBlobUserType.class)})
public class ImageBlob {

    @Id
    @GeneratedValue
    private int id;
    private String libelle;
    @Type(type="imageBlob")
    private Image image;
    
    
	public ImageBlob() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ImageBlob(int id, String libelle) {
		super();
		this.id = id;
		this.libelle = libelle;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
	}

}