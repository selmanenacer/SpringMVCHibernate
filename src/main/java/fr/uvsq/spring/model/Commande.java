package fr.uvsq.spring.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


@Entity
public class Commande {
	@Id
	@GeneratedValue
	private int id;
	private Date dateCommande;
	private double montant;
	
	@OneToMany(mappedBy="commande")
	private Set<LigneCommande> ligneCommandes = new HashSet<LigneCommande>();
	
	@ManyToOne 
	private Client client;
	
	public Commande(){
		super();
	}
	
	public Commande(Date dateCommande, double montant, Set<LigneCommande> ligneCommandes,
			Client client) {
		super();
		this.dateCommande = dateCommande;
		this.montant = montant;
		this.ligneCommandes = ligneCommandes;
		this.client = client;
	}
	public int getId() {
		return id;
	}
	public void setId(int idCommande) {
		this.id = idCommande;
	}
	public Date getDateCommande() {
		return dateCommande;
	}
	public void setDateCommande(Date dateCommande) {
		this.dateCommande = dateCommande;
	}
	public double getMontant() {
		return montant;
	}
	public void setMontant(double montant) {
		this.montant = montant;
	}
	public Set<LigneCommande> getLigneCommandes() {
		return ligneCommandes;
	}
	public void setLigneCommandes(Set<LigneCommande> ligneCommandes) {
		this.ligneCommandes = ligneCommandes;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	
}
