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
import fr.uvsq.spring.service.ClientService;

@Controller
public class ClientController {
	
	private ClientService clientService ;

	@Autowired(required=true)
	@Qualifier(value="clientService")
	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}
	
	//For add and update person both
	@RequestMapping(value= "/client/add", method = RequestMethod.POST)
	public String insert(@ModelAttribute("client") Client p , Model model){

		//p.setAdresse(@ModelAttribute("adress") Adresse a);
		
		if(!clientService.clientExist(p.getEmail())){
			//new person, add it
			p.setType(1);
			this.clientService.insert(p);
		}else if ( p.getId() !=0){
			//existing person, call update
			
			this.clientService.update(p);
		}else{
			//existing person, change email
			model.addAttribute("user", p );
			return "client" ;
		}
		
		return "redirect:/login";
		
	}
	
	
	
	
    
    
	
}
