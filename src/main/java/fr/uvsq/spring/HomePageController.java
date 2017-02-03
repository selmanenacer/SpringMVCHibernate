package fr.uvsq.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.uvsq.spring.model.Client;
import fr.uvsq.spring.model.LignePanier;
import fr.uvsq.spring.model.Produit;
import fr.uvsq.spring.service.CategorieService;
import fr.uvsq.spring.service.ClientService;
import fr.uvsq.spring.service.LignePanierService;
import fr.uvsq.spring.service.ProduitService;


@Controller
public class HomePageController {

	private ClientService clientService ;
	private ProduitService produitService ;
	private CategorieService categorieService ;
	private LignePanierService  lignePanierService;
	
	
	@Autowired(required=true)
	@Qualifier(value="clientService")
	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}

	@Autowired(required=true)
	@Qualifier(value="produitService")
	public void setProduitService(ProduitService produitService) {
		this.produitService = produitService;
	}
	
	@Autowired(required=true)
	@Qualifier(value="categorieService")
	public void setCategorieService(CategorieService categorieService ){
		this.categorieService = categorieService;
	}

	@Autowired(required=true)
	@Qualifier(value="lignePanierService")
	public void setLignePanierService(LignePanierService lignePanierService) {
		this.lignePanierService = lignePanierService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET )
	public String home(Model model , HttpServletRequest request) {
		model.addAttribute("listProduit", this.produitService.findAll());
		model.addAttribute("listCategorie", this.categorieService.findAll());
		
		return "index";
	}
	
	
	@RequestMapping(value = "/add/{id}", method = RequestMethod.GET)
	public String panierAdd(Model model ,@PathVariable("id") int id ,HttpServletRequest request ) {
		Produit p = produitService.findById(id) ;
		Client c = (Client) request.getSession().getAttribute("client_S");
		
		int id_lignePanier = lignePanierService.existProductClient(p.getId(), c.getId());
		if(id_lignePanier!=-1){
			LignePanier lp = lignePanierService.findById(id_lignePanier);
			lp.setQuantite(lp.getQuantite()+1);
			lp.setMontant(lp.getMontant()+p.getPrix());
			lignePanierService.update(lp);
			
		}else{
			System.out.println(" je ss ici ") ;
			LignePanier lp = new LignePanier();
			lp.setProduit(p);
			lp.setQuantite(1);
			lp.setMontant(p.getPrix());
			c.getLignePanier().add(lp);
			lp.setClient(c);
			lignePanierService.insert(lp);
		}
		request.getSession().setAttribute("client_S", clientService.findById(c.getId()));
		return "redirect:/";
	}
	
	@RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
	public String panierRemove(Model model ,@PathVariable("id") int id ,HttpServletRequest request ) {
		Produit p = produitService.findById(id) ;
		Client c = (Client) request.getSession().getAttribute("client_S");	
		int id_lignePanier = lignePanierService.existProductClient(p.getId(), c.getId());
		this.lignePanierService.delete(id_lignePanier);
		request.getSession().setAttribute("client_S", clientService.findById(c.getId()));
		return "redirect:/";
	}

	@RequestMapping(value = "/enregistrer", method = RequestMethod.GET)
	public String enregistrer(Model model) {
		model.addAttribute("client", new Client());
		return "enregistrer";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		return "list";
	}
	
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String addProduct(Model model) {
		model.addAttribute("login", new Client());
		return "product";
	}

}
