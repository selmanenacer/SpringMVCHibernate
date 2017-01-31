package fr.uvsq.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.uvsq.spring.model.Categorie;
import fr.uvsq.spring.model.Client;
import fr.uvsq.spring.service.CategorieService;


@Controller
public class CategorieController {

	private CategorieService categorieService ;
	
	@Autowired(required=true)
	@Qualifier(value="categorieService")
	public void setCategorieService(CategorieService categorieService) {
		this.categorieService = categorieService;
	}
	
	@RequestMapping(value = "/categories", method = RequestMethod.GET)
	public String listclients(Model model) {
		model.addAttribute("categorie", new Categorie());
		model.addAttribute("listCategorie", this.categorieService.findAll());
		return "categories";
	}
	
	//For add and update person both
		@RequestMapping(value= "/categorie/add", method = RequestMethod.POST)
		public String insert(@ModelAttribute("categorie") Categorie p){
			
			if(p.getId() == 0){
				//new person, add it
				this.categorieService.insert(p);
			}else{
				//existing person, call update
				this.categorieService.update(p);
			}
			
			return "redirect:/categories";
		}
		
		@RequestMapping("/removeCategorie/{id}")
	    public String removeClient(@PathVariable("id") int id){
			
	        this.categorieService.delete(id); 
	        return "redirect:/categories";
	    }
		
		@RequestMapping("/editCategorie/{id}")
	    public String editClient(@PathVariable("id") int id, Model model){
	        model.addAttribute("categorie", this.categorieService.findById(id));
	        model.addAttribute("listClients", this.categorieService.findAll());
	        return "categories";
	    }
}
