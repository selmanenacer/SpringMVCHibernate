package fr.uvsq.spring.util;

import java.awt.Image;
import java.io.File;
import java.io.IOException;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import fr.uvsq.spring.model.ImageBlob;
import fr.uvsq.spring.service.ImageBlobService;

public class ImageBlobTest {
    
    public static void main(String[] args) throws IOException {
    	String [] configLocations = new String[3];
    	configLocations[0] = "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml";
    	configLocations[1] = "file:src/main/webapp/WEB-INF/spring/dataBase-context.xml";
    	configLocations[2] = "file:src/main/webapp/WEB-INF/spring/root-context.xml";
    	ApplicationContext appContext = (ApplicationContext) new ClassPathXmlApplicationContext(configLocations, true);
    	ImageBlobService ser = (ImageBlobService) appContext.getBean("imageBlobService");
    	//ser.purgerImageBlob();
    	//ser.insererImageBlob("logo_electronix", new File("src/main/webapp/resources/images/ordi1.jpg"));
    	//ser.modifierImageBlob(1, "logo_dvp", new File("src/main/webapp/resources/images/ordi2.jpg"));
    	File file = new File("src/main/webapp/resources/images/izan.jpg");
    	
    	ImageBlob img = ser.findById(1);
    	//Image image = img.getImage().getGraphics().create();
    	//img.getImage()
    	ser.lireImageBlob(1, file);
    	System.out.println(file.getAbsolutePath());
    	
    	
    }
     
}