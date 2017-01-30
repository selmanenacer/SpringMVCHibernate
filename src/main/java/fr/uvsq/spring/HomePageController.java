package fr.uvsq.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.uvsq.spring.model.Client;
import fr.uvsq.spring.service.ClientService;


@Controller
public class HomePageController {

	private ClientService clientService ;
	
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

}
