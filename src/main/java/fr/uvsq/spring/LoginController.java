package fr.uvsq.spring;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.uvsq.spring.dao.ClientDAOImpl;

import fr.uvsq.spring.model.Client;
import fr.uvsq.spring.service.ClientService;


@Controller
public class LoginController {

	private ClientService clientService ;

	@Autowired(required=true)
	@Qualifier(value="clientService")
	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String listclients(Model model) {
		model.addAttribute("login", new Client());
		return "login";
	}
	
	@RequestMapping(value= "/login", method = RequestMethod.POST)
	public String getClient(@ModelAttribute("login") Client p,Model model){
		
			Client c = clientService.isValidClient(p.getEmail(), p.getPsw());
			if(c != null){
				if(c.getType()==1){
					model.addAttribute("client" , c);
					return "login";
				}else if(c.getType()==2){
					model.addAttribute("admin" , c);
					return "login";
				}
			}else {
				model.addAttribute("erreur" , "client inexistant");
				return "login";
			}
		
		
			return "login";
		
		
		
	}
}
