package co.grandcircus.TutorApp2019.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import co.grandcircus.TutorApp2019.entity.Student;
import co.grandcircus.TutorApp2019.entity.TimeLedger;
import co.grandcircus.TutorApp2019.entity.Tutor;
import co.grandcircus.TutorApp2019.repo.StudentRepo;
import co.grandcircus.TutorApp2019.repo.TimeLedgerRepo;
import co.grandcircus.TutorApp2019.repo.TutorRepo;

@Controller
public class HomeController {

	@Value("${map.key}")
	private String mapKey;
	
	@Value("${yelp.key}")
	private String yelpKey;
	
	@Autowired
	TutorRepo tr;
	
	@Autowired
	StudentRepo sr;
	
	@Autowired
	TimeLedgerRepo tlr;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletResponse response;

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
		Tutor t = tr.findByLatitudeAndLongitude(lat, lng);
		session.setAttribute("tutorName", t.getName());
		session.setAttribute("tutor", new Tutor(t.getId(), t.getName(), t.getLatitude(), t.getLongitude(), 
				t.getEmail(), t.getPassword(), t.getSubject(), t.getBio(), t.getRating(), t.getReview()));
		mv.addObject("latitude", coords.get(0));
		mv.addObject("longitude", coords.get(1));
		mv.addObject("mapKey", mapKey);
		mv.addObject("tutor", session.getAttribute("tutor")); 
		return mv;	
	}
	
	@RequestMapping("get-location")
	public ModelAndView getLocation() {
		ModelAndView mv = new ModelAndView("map-display");
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
	
	@RequestMapping("confirm-session")
	public ModelAndView confirmSession() {
		ModelAndView mv = new ModelAndView("confirmation-page");
		mv.addObject("student", session.getAttribute("student"));
		mv.addObject("tutor", session.getAttribute("tutor"));
		return mv;
	}
	
	@RequestMapping("confirmation")
	public ModelAndView confirmationDisplay(@RequestParam("meetingLocation") String meetingLocation, @RequestParam("studentInfo") Student student, @RequestParam("tutorInfo") Tutor tutor, 
			@RequestParam("duration") Integer duration, @RequestParam("startTime") String time) {
		tlr.save(new TimeLedger(student, tutor, meetingLocation, time, duration)); 
		return new ModelAndView("confirmation-page");
	}
	
	
	// This mapping takes one to the student registration page.
	@RequestMapping("register-student")
	public ModelAndView registerStudent() {
		ModelAndView mv = new ModelAndView("register-student");
		return mv;
	}
	// This mapping takes one to the tutor registration page.
	@RequestMapping("register-tutor")
	public ModelAndView registerTeacher() {
		ModelAndView mv = new ModelAndView("register-tutor");
		return mv;
	}
	// This mapping adds students to the database.
	@RequestMapping("register-s")
	public ModelAndView registerStud(Student student) {
		ModelAndView mv = new ModelAndView("index");
		sr.save(student);
		return mv;
	}
	// This mapping adds tutors to the database.
	@RequestMapping("register-t")
	public ModelAndView registerTeach(Tutor t) {
		ModelAndView mv = new ModelAndView("index");
		tr.save(t);
		return mv;
	}
	
	@RequestMapping("student-login")
	public ModelAndView studentLogin(@RequestParam("email") String email) {
		ModelAndView mv = new ModelAndView("redirect:/get-location");
		Student s = sr.findByEmail(email);
		session.setAttribute("studentName", s.getName());
		session.setAttribute("student", new Student(s.getId(), s.getName(), s.getEmail(), s.getPassword()));
		mv.addObject("student", session.getAttribute("student"));
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
