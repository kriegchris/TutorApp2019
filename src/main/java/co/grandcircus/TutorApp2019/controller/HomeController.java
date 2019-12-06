package co.grandcircus.TutorApp2019.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.TutorApp2019.entity.MapData;
import co.grandcircus.TutorApp2019.entity.Tutor;
import co.grandcircus.TutorApp2019.repo.TutorRepo;

@Controller
public class HomeController {
	
	@Value("${map.key}")
	private String mapKey;
	
	@Autowired
	TutorRepo tr;
	
	RestTemplate rt = new RestTemplate();
	
	@RequestMapping("/")
	public ModelAndView homepage() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("mapKey", mapKey);
		return mv;
	}
	
	@RequestMapping("get-location")
	public ModelAndView getLocation() {
		ModelAndView mv = new ModelAndView("index");
		String url = "https://www.googleapis.com/geolocation/v1/geolocate?key=" + mapKey;
		
		MapData request = new MapData();
		MapData data = rt.postForObject(url, request, MapData.class);
		
		mv.addObject("latitude", data.getLocation().getLat());
		mv.addObject("longitude", data.getLocation().getLng());
		mv.addObject("mapKey", mapKey);
		
		List<Tutor> tutorList = tr.findAll();
		mv.addObject("tutors", tutorList);
		System.out.println(tutorList);
		
		System.out.println(data.getLocation().getLat());
		System.out.println(data.getLocation().getLng());
		return mv;
	}
	

	
}
