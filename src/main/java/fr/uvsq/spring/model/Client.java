package fr.uvsq.spring.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Client {
	@Id
	@GeneratedValue
	private int id ;
	private String nom;
	private String prenom;
	private String email;
	private String psw;
	private int tel;
	
	@OneToOne(mappedBy="client", cascade=CascadeType.ALL)
	private Panier panier;
	
	@OneToOne (cascade = CascadeType.ALL)
	private Adresse adresse;
	
	@OneToMany(mappedBy="client")
	private Set<Commande> commande = new HashSet<Commande>();
	
	public Client() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Client(String nom, String prenom, String email, String psw, int tel, Panier panier, Adresse adresse,
			Set<Commande> commande) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.psw = psw;
		this.tel = tel;
		this.panier = panier;
		this.adresse = adresse;
		this.commande = commande;
	}

	public int getId() {
		return id;
	}

	public void setId(int idClient) {
		this.id = idClient;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	public int getTel() {
		return tel;
	}

	public void setTel(int tel) {
		this.tel = tel;
	}

	public Panier getPanier() {
		return panier;
	}

	public void setPanier(Panier panier) {
		this.panier = panier;
	}

	public Adresse getAdresse() {
		return adresse;
	}

	public void setAdresse(Adresse adresse) {
		this.adresse = adresse;
	}

	public Set<Commande> getCommande() {
		return commande;
	}

	public void setCommande(Set<Commande> commande) {
		this.commande = commande;
	}
	
	
	
	
	

}
