package fr.uvsq.spring.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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
	@Column(columnDefinition="int(1) null default 1 ")
	private int type;
	
	@OneToOne (cascade = CascadeType.ALL)
	private Adresse adresse;
	
	@OneToMany(mappedBy="client")
	private Set<Commande> commande = new HashSet<Commande>();
	
	public Client() {
		super();
		
	}

	

	public Client(int id, String nom, String prenom, String email, String psw, int tel) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.psw = psw;
		this.tel = tel;
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

	
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
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
