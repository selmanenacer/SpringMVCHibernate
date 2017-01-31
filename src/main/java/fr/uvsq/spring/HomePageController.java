package fr.uvsq.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.uvsq.spring.model.Client;
import fr.uvsq.spring.service.CategorieService;
import fr.uvsq.spring.service.ClientService;
import fr.uvsq.spring.service.ProduitService;


@Controller
public class HomePageController {

	private ClientService clientService ;
	private ProduitService produitService ;
	private CategorieService categorieService ;
	
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

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("listProduit", this.produitService.findAll());
		model.addAttribute("listCategorie", this.categorieService.findAll());
		return "index";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String connexion(Model model) {
		model.addAttribute("login", new Client());
		return "login";
	}
	
	@RequestMapping(value = "/enregistrer", method = RequestMethod.GET)
	public String enregistrer(Model model) {
		model.addAttribute("login", new Client());
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
