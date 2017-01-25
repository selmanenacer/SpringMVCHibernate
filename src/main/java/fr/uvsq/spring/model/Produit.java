package fr.uvsq.spring.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Produit {
	@Id
	@GeneratedValue
	private int id;
	
	private String libelle;
	
	@ManyToOne 
	private Categorie categorie;
	
	private int stock;
	
	public Produit(){
		super();
	}
	
	public Produit(String libelle, Categorie categorie, int stock) {
		super();
		this.libelle = libelle;
		this.categorie = categorie;
		this.stock = stock;
	}
	public int getIdProduit() {
		return id;
	}
	public void setIdProduit(int idProduit) {
		this.id = idProduit;
	}
	public String getLibelle() {
		return libelle;
	}
	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}
	public Categorie getCategorie() {
		return categorie;
	}
	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	

}
