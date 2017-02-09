package fr.uvsq.spring;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import fr.uvsq.spring.model.Client;
import fr.uvsq.spring.model.Commande;
import fr.uvsq.spring.model.LigneCommande;
import fr.uvsq.spring.service.ClientService;
import fr.uvsq.spring.service.CommandeService;

@Controller
public class AdminController {

	private ClientService clientService ;
	private CommandeService commandeService;

	@Autowired(required=true)
	@Qualifier(value="clientService")
	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}
	
	@Autowired(required=true)
	@Qualifier(value="commandeService")
	public void setCommandeService(CommandeService commandeService) {
		this.commandeService = commandeService;
	}

	@RequestMapping(value = "/adminHomePage", method = RequestMethod.GET)
	public String adminHomePage(Model model, HttpServletRequest request) {
		if(request.getSession().getAttribute("admin_S")==null){
			return "redirect:/login";
		}else{
			return "adminHomePage"; 
		}
	}


	@RequestMapping(value = "/clientAdmin", method = RequestMethod.GET)
	public String listclients(Model model, HttpServletRequest request) {
		if(request.getSession().getAttribute("admin_S")==null){
			return "redirect:/login";
		}else{
			model.addAttribute("client", new Client());
			
			List<Client> clients = this.clientService.findAll();
			for(Iterator<Client> it= clients.iterator();it.hasNext();){
				Client c = it.next();
				if(c.getType()==2)
					it.remove();
			}
			
			model.addAttribute("listClients", clients);
			return "clientAdmin"; 
		}
	}
	
	@RequestMapping(value = "/voirCommande/{id}", method = RequestMethod.GET)
	public String voirCommande(Model model,@PathVariable("id") int id, HttpServletRequest request) {
		if(request.getSession().getAttribute("admin_S")==null){
			return "redirect:/login";
		}else{
			
			model.addAttribute("commande", commandeService.findById(id));
			Commande c = commandeService.findById(id);
			
			System.out.println("je suis laaaaaaaaaaaaaaaaaa : " + c.getLigneCommandes().size());
			for(int i=0 ; i<c.getLigneCommandes().size();i++){
				LigneCommande lc = c.getLigneCommandes().get(i);
				System.out.println("je suis laaaaaaaaaaaaaaaaaa");
				System.out.println(lc.getId() +" " + lc.getQuantite()+" "+ lc.getMontant());
			}
			
			return "voirCommande"; 
		}
	}
	
	@RequestMapping(value = "/listCommande", method = RequestMethod.GET)
	public String listCommande(Model model, HttpServletRequest request) {
		if(request.getSession().getAttribute("admin_S")==null){
			return "redirect:/login";
		}else{

			model.addAttribute("listCommande", commandeService.findAll());
			return "listCommande"; 
		}
	}
	
	@RequestMapping("/removeCommande/{id}")
    public String removeCommande(@PathVariable("id") int id){
		
        this.commandeService.delete(id);
        return "redirect:/listCommande";
    }
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String listadmin(Model model, HttpServletRequest request) {
		if(request.getSession().getAttribute("admin_S")==null){
			return "redirect:/login";
		}else{
			model.addAttribute("client", new Client());
			
			List<Client> clients = this.clientService.findAll();
			for(Iterator<Client> it= clients.iterator();it.hasNext();){
				Client c = it.next();
				if(c.getType()==1)
					it.remove();
			}
			
			model.addAttribute("listClients", clients);
			return "addAdmin"; 
		}
	}
	
	
	
	
	@RequestMapping(value= "/admin/add", method = RequestMethod.POST)
	public String insert(@ModelAttribute("client") Client p , Model model){

		//p.setAdresse(@ModelAttribute("adress") Adresse a);
		
		if(!clientService.clientExist(p.getEmail())){
			//new person, add it
			p.setType(2);
			this.clientService.insert(p);
		}else if ( p.getId() !=0){
			//existing person, call update
			p.setType(2);
			this.clientService.update(p);
		}else{
			//existing person, change email
			model.addAttribute("user", p );
			return "client" ;
		}
		
		return "redirect:/admin";
		
	}
	
	@RequestMapping("/removeClientAdmin/{id}")
    public String removeClient(@PathVariable("id") int id){
		
        this.clientService.delete(id); 
        return "redirect:/clientAdmin";
    }
	
	@RequestMapping("/removeAdmin/{id}")
    public String removeAdmin(@PathVariable("id") int id){
		
        this.clientService.delete(id); 
        return "redirect:/admin";
    }
	
	@RequestMapping("/editAdmin/{id}")
	public String editClient(@PathVariable("id") int id, Model model){
		model.addAttribute("client", this.clientService.findById(id));
		List<Client> clients = this.clientService.findAll();
		for(Iterator<Client> it= clients.iterator();it.hasNext();){
			Client c = it.next();
			if(c.getType()==1)
				it.remove();
		}
		model.addAttribute("listClients", clients);
		return "addAdmin";
	}
	
	
}
