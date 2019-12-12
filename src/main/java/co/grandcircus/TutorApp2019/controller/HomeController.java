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
import co.grandcircus.TutorApp2019.entity.GoogleMarks;
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
	public ModelAndView findCenter(@RequestParam("tutorName") String name) {
		ModelAndView mv = new ModelAndView("center-map");
		Tutor t = tr.findByName(name);
		ArrayList<Double> coords = (ArrayList<Double>) getCenter(t.getLatitude(), t.getLongitude());
		session.setAttribute("tutorName", t.getName());
		session.setAttribute("tutor", t);
		mv.addObject("latitude", coords.get(0));
		mv.addObject("longitude", coords.get(1));
		mv.addObject("mapKey", mapKey);
		mv.addObject("tutor", session.getAttribute("tutor")); 
		System.out.println("Tutor from find-center: " + t.getId());
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

		ArrayList<GoogleMarks> marks = new ArrayList<>();
		List<Tutor> tutors = tr.findAll();
		
		for (Tutor t : tutors) {
			marks.add(dataToMarks(t));
		}
		
		mv.addObject("tutors", marks);
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
		Student s = (Student) session.getAttribute("student"); 
		mv.addObject("studentId", s.getId());
		System.out.println("Search-business student id: " + s.getId());
		Tutor t = (Tutor) session.getAttribute("tutor");
		mv.addObject("tutorId", t.getId()); 
		System.out.println("Search-business tutor id: " + t.getId());
		return mv;
	}
	
	//this is to confirm location for session
	//FIXME
	@RequestMapping("confirm-session")
	public ModelAndView confirmSession(String meetingLocation) {
		ModelAndView mv = new ModelAndView("confirmation-page");
		mv.addObject("student", session.getAttribute("student"));
		mv.addObject("tutor", session.getAttribute("tutor"));
		mv.addObject("meetingLocation", meetingLocation);
		System.out.println("Confirm-session mapping: " + session.getAttribute("student"));
		return mv;
	}
	
	//adds all meeting details to time ledger table 
	@RequestMapping("confirmation")
	public ModelAndView confirmationDisplay(String meetingLocation, Integer studentId, Integer tutorId, 
			Integer duration, String startTime) {
		System.out.println("Confirmation mapping to session display: " + meetingLocation + " " + 
			studentId + " " + tutorId);
		// .orElse(null) will return null if nothing exists
		Student student = sr.findById(studentId).orElse(null);
		Tutor tutor = tr.findById(tutorId).orElse(null); 
		tlr.save(new TimeLedger(student, tutor, meetingLocation, startTime, duration)); 
		return new ModelAndView("session-display");
	}
	
	//FIXME
	@RequestMapping("tutor-sessions")
	public ModelAndView tutorSessionsDisplay(Tutor tutor) {
		Tutor t = (Tutor) session.getAttribute("tutor"); 
		return new ModelAndView("tutor-sessions", "sessions", tlr.findByTutorId(t.getId()));
	}
	
	
	@RequestMapping("student-sessions")
	public ModelAndView studentSessionDisplay (Student student) {
		Student s = (Student) session.getAttribute("student"); 
		return new ModelAndView("student-sessions", "sessions", tlr.findByStudentId(s.getId()));
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
	
	@RequestMapping("tutor-welcome")
	public ModelAndView tutorHome() {
		return new ModelAndView("tutor-welcome");
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
		session.setAttribute("studentName", sr.findByEmail(email).getName());
		session.setAttribute("student", sr.findByEmail(email));
		//session.setAttribute("student", new Student(s.getId(), s.getName(), s.getEmail(), s.getPassword()));
		mv.addObject("student", session.getAttribute("student"));
		System.out.println("Student login: " + session.getAttribute("student"));
		return mv;
	}
	
	@RequestMapping("tutor-login")
	public ModelAndView tutorLogin(@RequestParam("email") String email) {
		ModelAndView mv = new ModelAndView("tutor-welcome");
		session.setAttribute("tutorName", tr.findByEmail(email).getName());
		session.setAttribute("tutor", tr.findByEmail(email));
		mv.addObject("tutor", session.getAttribute("tutor"));
		System.out.println("Tutor login: " + session.getAttribute("tutor"));
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

	public GoogleMarks dataToMarks(Tutor tutor) {
		String gName = tutor.getName();
		double gLat = tutor.getLatitude();
		double gLng = tutor.getLongitude();

		return new GoogleMarks(gName, gLat, gLng);
	}

}
