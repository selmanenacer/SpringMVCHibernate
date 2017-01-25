package fr.uvsq.spring.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Facture {
	@Id
	@GeneratedValue
	private int id;
	
	@OneToOne(cascade=CascadeType.ALL)
	private Commande commande;
	
	public Facture(){
		super();
	}
	
	public Facture(Commande commande) {
		super();
		this.commande = commande;
	}
	public int getId_facture() {
		return id;
	}
	public void setId_facture(int id_facture) {
		this.id = id_facture;
	}
	public Commande getCommande() {
		return commande;
	}
	public void setCommande(Commande commande) {
		this.commande = commande;
	}
	
	
	
}
