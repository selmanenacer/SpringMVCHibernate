package fr.uvsq.spring.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Cascade;

@Entity
public class LigneCommande {
	@Id
	@GeneratedValue
	private int id;
	private int quantite;
	private double montant;
	@OneToOne
	private Produit produit;
	
	@ManyToOne
	private Commande commande;
	
	public LigneCommande(){
		super();
	}
	
	public LigneCommande(int quantite, double montant, Produit produit, Commande commande) {
		super();
		this.quantite = quantite;
		this.montant = montant;
		this.produit = produit;
		this.commande = commande;
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
	public Commande getCommande() {
		return commande;
	}
	public void setCommande(Commande commande) {
		this.commande = commande;
	}
	
	
}
