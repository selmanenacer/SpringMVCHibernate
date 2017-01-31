package fr.uvsq.spring;

import javax.servlet.http.HttpServletRequest;

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
	public String getClient(@ModelAttribute("login") Client p,Model model, HttpServletRequest request){
		
			Client c = clientService.isValidClient(p.getEmail(), p.getPsw());
			if(c != null){
				if(c.getType()==1){
					model.addAttribute("client" , c);
					request.getSession().setAttribute("client_S", c);
					return "redirect:/";
				}else if(c.getType()==2){
					request.getSession().setAttribute("admin_S", c);
					model.addAttribute("admin" , c);
					return "adminHomePage";  
				}
			}else {
				model.addAttribute("erreur" , "Mot de passe ou login incorrecte");
				return "login";
			}
			return "login";	
	}
}
