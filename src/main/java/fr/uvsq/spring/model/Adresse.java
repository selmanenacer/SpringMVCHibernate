package fr.uvsq.spring.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Adresse {
	@Id
	@GeneratedValue
	private int id;
	private String rue;
	private String ville;
	private int codePostal;
	
	public Adresse() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Adresse(String rue, String ville, int codePostal) {
		super();
		this.rue = rue;
		this.ville = ville;
		this.codePostal = codePostal;
	}
	public int getId() {
		return id;
	}
	public void setId(int idAdresse) {
		this.id = idAdresse;
	}
	public String getRue() {
		return rue;
	}
	public void setRue(String rue) {
		this.rue = rue;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	public int getCodePostal() {
		return codePostal;
	}
	public void setCodePostal(int codePostal) {
		this.codePostal = codePostal;
	}
	
	

}
