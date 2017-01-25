package fr.uvsq.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.uvsq.spring.model.Client;
import fr.uvsq.spring.model.Person;
import fr.uvsq.spring.service.ClientService;

@Controller
public class ClientController {
	
	private ClientService clientService ;

	@Autowired(required=true)
	@Qualifier(value="clientService")
	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}
	
	@RequestMapping(value = "/clients", method = RequestMethod.GET)
	public String listclients(Model model) {
		model.addAttribute("client", new Client());
		model.addAttribute("listClients", this.clientService.findAll());
		return "client";
	}
	
	//For add and update person both
	@RequestMapping(value= "/client/add", method = RequestMethod.POST)
	public String insert(@ModelAttribute("client") Client p){
		
		//p.setAdresse(@ModelAttribute("adress") Adresse a);
		if(p.getId() == 0){
			//new person, add it
			this.clientService.insert(p);
		}else{
			//existing person, call update
			this.clientService.update(p);
		}
		
		return "redirect:/clients";
		
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
	
}
