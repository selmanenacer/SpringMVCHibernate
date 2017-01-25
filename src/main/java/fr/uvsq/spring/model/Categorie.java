package fr.uvsq.spring.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Categorie {
	@Id
	@GeneratedValue
	private int id;
	private String nom;
	private String description;
	
	@OneToMany(mappedBy="categorie")
	private Set<Produit> listProduit = new HashSet<Produit>();
	
	public Categorie() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Categorie( String nom, String description, Set<Produit> listProduit) {
		super();
		this.nom = nom;
		this.description = description;
		this.listProduit = listProduit;
	}
	public int getId() {
		return id;
	}
	
	public void setId(int idCategorie) {
		this.id = idCategorie;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Set<Produit> getListProduit() {
		return listProduit;
	}
	public void setListProduit(Set<Produit> listProduit) {
		this.listProduit = listProduit;
	}
	
	
}
