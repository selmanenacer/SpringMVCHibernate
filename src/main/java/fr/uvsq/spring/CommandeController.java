package fr.uvsq.spring;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.uvsq.spring.model.Client;
import fr.uvsq.spring.model.Commande;
import fr.uvsq.spring.model.LigneCommande;
import fr.uvsq.spring.model.LignePanier;
import fr.uvsq.spring.service.ClientService;
import fr.uvsq.spring.service.CommandeService;
import fr.uvsq.spring.service.LigneCommandeService;
import fr.uvsq.spring.service.LignePanierService;

@Controller
public class CommandeController {
	
	private LignePanierService  lignePanierService;
	private LigneCommandeService ligneCommandeService;
	private CommandeService commandeService;
	private ClientService clientService;

	@Autowired(required=true)
	@Qualifier(value="lignePanierService")
	public void setLignePanierService(LignePanierService lignePanierService) {
		this.lignePanierService = lignePanierService;
	}

	@Autowired(required=true)
	@Qualifier(value="ligneCommandeService")
	public void setLigneCommandeService(LigneCommandeService ligneCommandeService) {
		this.ligneCommandeService = ligneCommandeService;
	}

	@Autowired(required=true)
	@Qualifier(value="commandeService")
	public void setCommandeService(CommandeService commandeService) {
		this.commandeService = commandeService;
	}

	@Autowired(required=true)
	@Qualifier(value="clientService")
	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}

	@RequestMapping(value= "/commander", method = RequestMethod.POST)
	public String getCommande(Model model, HttpServletRequest request){
		
		Client c = (Client) request.getSession().getAttribute("client_S");
		List<LignePanier> listLignesPanier = c.getLignePanier();
		List<LigneCommande> listLignesCommandes = new ArrayList<LigneCommande>();
		double montantTotal = 0;
		
		Commande commande = new Commande();
		commande.setClient(c);
		commande.setDateCommande(new Date());
		for (LignePanier lignePanier : listLignesPanier) {
			LigneCommande ligneCommande = new LigneCommande();
			ligneCommande.setMontant(lignePanier.getMontant());
			ligneCommande.setProduit(lignePanier.getProduit());
			ligneCommande.setQuantite(lignePanier.getQuantite());
			ligneCommande.setCommande(commande);
			listLignesCommandes.add(ligneCommande);
			montantTotal = montantTotal + lignePanier.getMontant();
			lignePanierService.delete(lignePanier.getId());
		}
		commande.setLigneCommandes(listLignesCommandes);
		commande.setMontant(montantTotal);
		commandeService.insert(commande);
		for (LigneCommande ligneCommande : listLignesCommandes) {
			ligneCommandeService.insert(ligneCommande);
		}
		//raffrichir la variable de session
		request.getSession().setAttribute("client_S", clientService.findById(c.getId()));
		return "redirect:/";
	}
		

}
