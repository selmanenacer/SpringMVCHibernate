package fr.uvsq.spring;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import fr.uvsq.spring.model.Categorie;
import fr.uvsq.spring.model.Produit;
import fr.uvsq.spring.service.CategorieService;
import fr.uvsq.spring.service.ProduitService;

@Controller
public class ProduitController {

	private ProduitService produitService ;
	private CategorieService categorieService;
	@Autowired
    private HttpServletRequest request;
	@Autowired
    ServletContext context; 


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

	@RequestMapping(value = "/produits", method = RequestMethod.GET)
	public String listclients(Model model) {
		model.addAttribute("produit", new Produit());
		model.addAttribute("listProduit", this.produitService.findAll());
		model.addAttribute("listCategorie", this.categorieService.findAll());
		return "produits"; 
	}

	@RequestMapping(value= "/produit/add", method = RequestMethod.POST)
	public String insert(@ModelAttribute("produit") Produit p ,@RequestParam("file") MultipartFile file){
		 String orgName ;
		if(p.getId() == 0){
			//new person, add it
			Categorie c= categorieService.findById(p.getCategorie().getId());
			p.setCategorie(c);
			
			String realPathtoUploads   = context.getRealPath("/resources/images/"); 
			 
			 if (!file.isEmpty()) {
				 
				 try{
					 if(! new File(realPathtoUploads).exists())
	                 {
	                     new File(realPathtoUploads).mkdir();
	                 }
					   orgName = file.getOriginalFilename();
					  System.err.println("__________"+orgName);
	                  String filePath = realPathtoUploads + orgName;
	                  System.err.println("____filepath______"+filePath);
	                  File dest = new File(filePath);
	                  file.transferTo(dest);
	                  p.setUrlImg(orgName);
				 }catch (Exception e) {
				e.printStackTrace();
				}
			 }
			
			this.produitService.insert(p);
		}else{
			//existing person, call update
			Categorie c= categorieService.findById(p.getCategorie().getId());
			p.setCategorie(c);
			this.produitService.update(p);
		}
		return "redirect:/produits";
	}

	@RequestMapping("/removeProduit/{id}")
	public String removeClient(@PathVariable("id") int id){

		this.produitService.delete(id); 
		return "redirect:/produits";
	}

	@RequestMapping("/editProduit/{id}")
	public String editClient(@PathVariable("id") int id, Model model){
		model.addAttribute("produit", this.produitService.findById(id));
		model.addAttribute("listProduits", this.produitService.findAll());
		model.addAttribute("listCategorie", this.categorieService.findAll());
		return "produit";
	}


}
