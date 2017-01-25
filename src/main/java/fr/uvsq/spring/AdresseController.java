package fr.uvsq.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.uvsq.spring.model.Adresse;
import fr.uvsq.spring.service.AdresseService;

@Controller
public class AdresseController {
	
	private AdresseService adresseService;
	
	@Autowired(required=true)
	@Qualifier(value="adresseService")
	public void setPersonService(AdresseService ps){
		this.adresseService = ps;
	}
	
	
	@RequestMapping(value = "/adresses", method = RequestMethod.GET)
	public String listPersons(Model model) {
		model.addAttribute("adress", new Adresse());
		model.addAttribute("listAdresses", this.adresseService.findAll());
		return "adress";
	}
	
	//For add and update person both
	@RequestMapping(value= "/adress/add", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("adress") Adresse p){
		
		if(p.getId() == 0){
			//new person, add it
			this.adresseService.insert(p);
		}else{
			//existing person, call update
			this.adresseService.update(p);
		}
		
		return "redirect:/adresses";
		
	}
	
	@RequestMapping("/removeAdr/{id}")
    public String removePerson(@PathVariable("id") int id){
		
        this.adresseService.delete(id);
        return "redirect:/adresses";
    }
 
    @RequestMapping("/editAdr/{id}")
    public String editPerson(@PathVariable("id") int id, Model model){
        model.addAttribute("adress", this.adresseService.findById(id));
        model.addAttribute("listAdresses", this.adresseService.findAll());
        return "adress";
    }
	
}
