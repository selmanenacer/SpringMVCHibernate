package fr.uvsq.spring.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class LignePanier {
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	private int quantite;
	private double montant;
	@OneToOne (cascade = CascadeType.ALL)
	private Produit produit;
	
	@ManyToOne 
	private Client client;
	
	public LignePanier(){
		super();
	}
	
	public LignePanier(int quantite, double montant) {
		super();
		this.quantite = quantite;
		this.montant = montant;
	}
	public int getId() {
		return id;
	}
	public void setId(int idLigneCommande) {
		this.id = idLigneCommande;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	public double getMontant() {
		return montant;
	}
	public void setMontant(double montant) {
		this.montant = montant;
	}
	
	public Produit getProduit() {
		return produit;
	}
	
	public void setProduit(Produit produit) {
		this.produit = produit;
	}
	
}
