package fr.uvsq.spring;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.uvsq.spring.model.Client;

@Controller
public class AdminController {

	@RequestMapping(value = "/adminHomePage", method = RequestMethod.GET)
	public String adminHomePage(Model model, HttpServletRequest request) {
		System.out.println(request.getSession().getAttribute("admin_S"));
		if(request.getSession().getAttribute("admin_S")==null){
			return "redirect:/login";

		}else{
			Client client=null;
			client = (Client) request.getSession().getAttribute("admin_S");
			if(client.getType()!=2){
				return "redirect:/login";
			}else{
				return "adminHomePage"; 
			}
		}
	}
	
	

}
