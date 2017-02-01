package fr.uvsq.spring;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.uvsq.spring.model.Client;
import fr.uvsq.spring.service.ClientService;

@Controller
public class AdminController {

	private ClientService clientService ;

	@Autowired(required=true)
	@Qualifier(value="clientService")
	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}

	@RequestMapping(value = "/adminHomePage", method = RequestMethod.GET)
	public String adminHomePage(Model model, HttpServletRequest request) {
		if(request.getSession().getAttribute("admin_S")==null){
			return "redirect:/login";
		}else{
			return "adminHomePage"; 
		}
	}

/*
	@RequestMapping(value = "/clients", method = RequestMethod.GET)
	public String listclients(Model model, HttpServletRequest request) {
		if(request.getSession().getAttribute("admin_S")==null){
			return "redirect:/login";
		}else{
			model.addAttribute("client", new Client());
			model.addAttribute("listClients", this.clientService.findAll());
			return "clients"; 
		}
	}

	@RequestMapping("/removeClient/{id}")
	public String removeClient(@PathVariable("id") int id){

		this.clientService.delete(id); 
		return "redirect:/clients";
	}

	@RequestMapping("/editClient/{id}")
	public String editClient(@PathVariable("id") int id, Model model){
		model.addAttribute("client", this.clientService.findById(id));
		model.addAttribute("listClients", this.clientService.findAll());
		return "client";
	}

*/
}
