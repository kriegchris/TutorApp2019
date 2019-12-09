package co.grandcircus.TutorApp2019.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.TutorApp2019.entity.Business;
import co.grandcircus.TutorApp2019.entity.BusinessResults;
import co.grandcircus.TutorApp2019.entity.MapData;
import co.grandcircus.TutorApp2019.entity.Tutor;
import co.grandcircus.TutorApp2019.repo.TutorRepo;

@Controller
public class HomeController {

	@Value("${map.key}")
	private String mapKey;
	
	@Value("${yelp.key}")
	private String yelpKey;
	
	@Autowired
	TutorRepo tr;

	RestTemplate rt = new RestTemplate();

	@RequestMapping("/")
	public ModelAndView homePage() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("mapKey", mapKey);
		return mv;
	}

	@RequestMapping("find-center")
	public ModelAndView findCenter(@RequestParam("lat") Double lat, @RequestParam("lng") Double lng) {
		ModelAndView mv = new ModelAndView("center-map");
		ArrayList<Double> coords = (ArrayList<Double>) getCenter(lat, lng);
		tr.save(new Tutor("center", coords.get(0), coords.get(1)));
		mv.addObject("latitude", coords.get(0));
		mv.addObject("longitude", coords.get(1));
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
		return mv;
	}
	
	@RequestMapping("search-business")
	public ModelAndView searchBusiness(@RequestParam("cat") String cat, @RequestParam("radius") Integer radius, 
			@RequestParam("latitude") Double lat, @RequestParam("longitude") Double lng) {
		ModelAndView mv = new ModelAndView("results");
		List<Double> coords = getCenter(lat, lng);
		String url = "https://api.yelp.com/v3/businesses/search?" + "term=" + cat + 
		"&latitude=" + coords.get(0) + "&longitude=" + coords.get(1) + "&radius=" + radius;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer " + yelpKey);
		ResponseEntity<BusinessResults> businessResponse = rt.exchange(url, HttpMethod.GET, 
				new HttpEntity<String> ("parameters", headers), BusinessResults.class);
		List<Business> businesses = businessResponse.getBody().getBusinesses();
		mv.addObject("businesses", businesses);
		return mv;
	}
	
	public List<Double> getCenter(Double lat, Double lng) {
		List<Double> coordinates = new ArrayList<>();
		String url = "https://www.googleapis.com/geolocation/v1/geolocate?key=" + mapKey;
		
		MapData request = new MapData();
		MapData data = rt.postForObject(url, request, MapData.class);
		Double currentLat = data.getLocation().getLat();
		Double currentLng = data.getLocation().getLng();
		Double centerLat = (currentLat + lat) / 2;
		Double centerLng = (currentLng + lng) / 2;
		coordinates.add(centerLat);
		coordinates.add(centerLng);
		return coordinates;
	}


}
