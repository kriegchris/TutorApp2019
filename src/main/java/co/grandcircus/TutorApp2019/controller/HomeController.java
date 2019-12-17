package co.grandcircus.TutorApp2019.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
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

import co.grandcircus.TutorApp2019.entity.Student;
import co.grandcircus.TutorApp2019.entity.TimeLedger;
import co.grandcircus.TutorApp2019.entity.Tutor;
import co.grandcircus.TutorApp2019.json.Business;
import co.grandcircus.TutorApp2019.json.BusinessResults;
import co.grandcircus.TutorApp2019.json.Coordinates;
import co.grandcircus.TutorApp2019.json.MapData;
import co.grandcircus.TutorApp2019.json.PlaceResults;
import co.grandcircus.TutorApp2019.marks.BusinessMarks;
import co.grandcircus.TutorApp2019.marks.TutorMarks;
import co.grandcircus.TutorApp2019.repo.StudentRepo;
import co.grandcircus.TutorApp2019.repo.TimeLedgerRepo;
import co.grandcircus.TutorApp2019.repo.TutorRepo;

@Controller
public class HomeController {

	@Value("${map.key}")
	private String mapKey;

	@Value("${yelp.key}")
	private String yelpKey;
	
	@Value("${pubnub.publish.key}")
	private String pubnubPublishKey;
	
	@Value("${pubnub.subscribe.key}")
	private String pubnubSubKey;
	
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
	LocalDate today = LocalDate.now();

	@RequestMapping("/")
	public ModelAndView homePage() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("mapKey", mapKey);
		return mv;
	}
	
	// This mapping takes one to the student registration page.
	@RequestMapping("register-student")
	public ModelAndView registerStudent() {
		ModelAndView mv = new ModelAndView("register-student");
		return mv;
	}
	
	// This mapping adds students to the database.
	@RequestMapping("register-s")
	public ModelAndView registerStud(Student student) {
		ModelAndView mv = new ModelAndView("index");
		sr.save(student);
		return mv;
	}

	// This mapping takes one to the tutor registration page.
	@RequestMapping("register-tutor")
	public ModelAndView registerTeacher() {
		ModelAndView mv = new ModelAndView("register-tutor");
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
		try {
			ModelAndView mv = new ModelAndView("redirect:/get-location");
			//once the student logs in, we get their  name from the database and display on welcome/home page
			session.setAttribute("studentName", sr.findByEmail(email).getName());
			//this saves the student in order to use again when confirming a tutoring session
			session.setAttribute("student", sr.findByEmail(email));
			mv.addObject("student", session.getAttribute("student"));
			return mv;
		} catch (NullPointerException e) {
			//if email is not contained in database, invalid email  message appears
			ModelAndView mv = new ModelAndView("index");
			mv.addObject("studentError", "<span style=\"color:red;font-weight:bold\">Invalid email.</span>");
			return mv;
		}
	}

	@RequestMapping("tutor-login")
	public ModelAndView tutorLogin(@RequestParam("email") String email) {
		try {
			//same thing for tutor as student(above mapping) for when tutor logs in 
		ModelAndView mv = new ModelAndView("tutor-welcome");
		session.setAttribute("tutorName", tr.findByEmail(email).getName());
		session.setAttribute("tutor", tr.findByEmail(email));
		mv.addObject("tutor", session.getAttribute("tutor"));
		//added students current lng and lat to the map
		return mv;
		} catch (NullPointerException e) {
			//if email is not contained in database, invalid email message appears
			ModelAndView mv = new ModelAndView("index");
			mv.addObject("tutorError", "<span style=\"color:red;font-weight:bold\">Invalid email.</span>");
			return mv;
		}
	}
	
	//takes tutor to their home page after logging in & to home page through nav bar
	@RequestMapping("tutor-welcome")
	public ModelAndView tutorHome() {
		return new ModelAndView("tutor-welcome");
	}
	
	//finding user's location on the map & displaying all tutors on the map
	@RequestMapping("get-location")
	public ModelAndView getLocation() {
		ModelAndView mv = new ModelAndView("map-display");
		String url = "https://www.googleapis.com/geolocation/v1/geolocate?key=" + mapKey;
		MapData request = new MapData();
		MapData data = rt.postForObject(url, request, MapData.class);
		//added students current lng and lat to the map
		mv.addObject("latitude", data.getLocation().getLat());
		mv.addObject("longitude", data.getLocation().getLng());
		//used to render the  map
		mv.addObject("mapKey", mapKey);
		//saves users current lng and lat in session memory 
		session.setAttribute("currentLat", data.getLocation().getLat());
		session.setAttribute("currentLon", data.getLocation().getLng());
		//finds all the tutors in the database & stores them in an ArrayList to mark them on the map
		ArrayList<TutorMarks> marks = new ArrayList<>();
		List<Tutor> tutors = tr.findAll();
		
		//FIXME
		for (Tutor t : tutors) {
			marks.add(dataToTutorMarks(t));
		}
		mv.addObject("tutors", marks);
		//FIXME
		//implement pubnub later
		mv.addObject("pubKey", pubnubPublishKey);
		mv.addObject("subKey", pubnubSubKey);
		return mv;
	}

	//filters tutors by subject and displays only those tutors on the map for selected subject
	@RequestMapping("subject-filter")
	public ModelAndView filterSubject(String subject) {
		ModelAndView mv = new ModelAndView("map-display");
		String url = "https://www.googleapis.com/geolocation/v1/geolocate?key=" + mapKey;
		MapData request = new MapData();
		MapData data = rt.postForObject(url, request, MapData.class);
		
		//FIXME 
		//use current lat & lng already stored in sessions for mapping the current user
		mv.addObject("latitude", data.getLocation().getLat());
		mv.addObject("longitude", data.getLocation().getLng());
		mv.addObject("mapKey", mapKey);
		//filters database by subject & puts tutors in an ArrayList 
		ArrayList<TutorMarks> marks = new ArrayList<>();
		ArrayList<Tutor> tutors = tr.findBySubject(subject);
		
		//FIXME
		for (Tutor ts : tutors) {
			marks.add(dataToTutorMarks(ts));
		}
		mv.addObject("tutors", marks);
		return mv;
	}
	
	//finds the center point between student and tutor
	@RequestMapping("find-center")
	public ModelAndView findCenter(@RequestParam("tutorName") String name) {
		ModelAndView mv = new ModelAndView("center-map");
		//finds tutor by name to get their lng & lat
		Tutor t = tr.findByName(name);
		ArrayList<Double> coords = (ArrayList<Double>) getCenter(t.getLatitude(), t.getLongitude());
		mv.addObject("tutorLat", t.getLatitude());
		mv.addObject("tutorLon", t.getLongitude());
		
		//FIXME
		//already stored in sessions
		String url = "https://www.googleapis.com/geolocation/v1/geolocate?key=" + mapKey;
		MapData request = new MapData();
		MapData data = rt.postForObject(url, request, MapData.class);
		mv.addObject("stuLat", data.getLocation().getLat());
		mv.addObject("stuLon", data.getLocation().getLng());
		//selects the tutor and stores it in sessions memory for later use in tutor session confirmation/booking
		session.setAttribute("tutorName", t.getName());
		session.setAttribute("tutor", t);
		//this lat & lng returns the center point between the tutor and student
		mv.addObject("latitude", coords.get(0));
		mv.addObject("longitude", coords.get(1));
		mv.addObject("mapKey", mapKey);
		
		//FIXME
		//implement pubnub later
		mv.addObject("pubKey", pubnubPublishKey);
		mv.addObject("subKey", pubnubSubKey);
		return mv;
	}

	//displays all business, per category & radius around center point
	@RequestMapping("search-business")
	public ModelAndView searchBusiness(@RequestParam("cat") String cat, @RequestParam("radius") Integer radius,
			@RequestParam("latitude") Double lat, @RequestParam("longitude") Double lng) {
		ModelAndView mv = new ModelAndView("business-map");
		// converted miles from user entry to meters for yelp api for radius search
		radius = radius * 1609;
		String url = "https://api.yelp.com/v3/businesses/search?" + "term=" + cat + 
		"&latitude=" + lat + "&longitude=" + lng + "&radius=" + radius;
		HttpHeaders headers = new HttpHeaders();
		//for yelp api, we need bearer token
		headers.add("Authorization", "Bearer " + yelpKey);
		ResponseEntity<BusinessResults> businessResponse = rt.exchange(url, HttpMethod.GET,
				new HttpEntity<String>("parameters", headers), BusinessResults.class);
		// results from Yelp are stored in a List of Businesses
		List<Business> businesses = businessResponse.getBody().getBusinesses();
		ArrayList<BusinessMarks> businessMarks = new ArrayList<>();
		// Loop through list of businesses, extracting their address
		for (Business b : businesses) {
			// We are using the GoogleMaps API to find accurate coordinates for each business
			String url2 = "https://maps.googleapis.com/maps/api/geocode/json?address=" + b.getLocation().getAddress1()
					+ ",";
			// Some address have null values for address2 & address3, this prevents it being appended to the string
			// and if there are values, it will append them to the string 
			if (b.getLocation().getAddress2() != null) {
				url2 = url2 + b.getLocation().getAddress2() + ",";
			}
			if (b.getLocation().getAddress3() != null) {
				url2 = url2 + b.getLocation().getAddress3() + ",";
			}
			url2 = url2 + b.getLocation().getCity() + "," + b.getLocation().getState() + "&key=" + mapKey;
			// Feed the address through the GoogleMaps API
			PlaceResults data = rt.getForObject(url2, PlaceResults.class);
			// Extract the accurate coordinates for the business
			Coordinates c = data.getResults().get(0).getGeometry().getLocation();
			// Put those coordinates & business information in an ArrayList<BusinessMarks>
			businessMarks.add(new BusinessMarks(b.getImage_url(), b.getUrl(), b.getName(),
					data.getResults().get(0).getFormatted_address(), c.getLat(), c.getLng()));
		}
		mv.addObject("businessMarks", businessMarks);
		mv.addObject("stuLat", session.getAttribute("currentLat"));
		mv.addObject("stuLon", session.getAttribute("currentLon"));
		Tutor t = (Tutor) session.getAttribute("tutor");
		
		mv.addObject("tutorLat", t.getLatitude());
		mv.addObject("tutorLon", t.getLongitude());
		mv.addObject("latitude", lat);
		mv.addObject("longitude", lng);
		mv.addObject("mapKey", mapKey);
		mv.addObject("tutorId", t.getId()); 
		Student s = (Student) session.getAttribute("student");
		mv.addObject("studentId", s.getId());
		//FIXME
		//implement pubnub later
		mv.addObject("pubKey", pubnubPublishKey);
		mv.addObject("subKey", pubnubSubKey);
		return mv;
	}

	// this is to confirm location for session
	@RequestMapping("confirm-session")
	public ModelAndView confirmSession(String meetingLocation) {
		ModelAndView mv = new ModelAndView("confirmation-page");
		mv.addObject("student", session.getAttribute("student"));
		mv.addObject("tutor", session.getAttribute("tutor"));
		mv.addObject("meetingLocation", meetingLocation); //comes from the anchor tag in business-map.jsp
		return mv;
	}

	// adds all meeting details to time ledger table
	@RequestMapping("confirmation")
	public ModelAndView confirmationDisplay(String meetingLocation, Integer studentId, Integer tutorId,
			Integer duration, String startTime) {
		// .orElse(null) will return null if nothing exists
		Student student = sr.findById(studentId).orElse(null);
		Tutor tutor = tr.findById(tutorId).orElse(null);
		Boolean completed = false;
		LocalDate sessionDate = LocalDate.now();
		tlr.save(new TimeLedger(student, tutor, meetingLocation, startTime, duration, completed, sessionDate));
		return new ModelAndView("session-display");
	}

	//display all tutors past sessions
	@RequestMapping("past-tutor-sessions")
	public ModelAndView tutorSessionsDisplay(Tutor tutor) {
		ModelAndView mv = new ModelAndView("past-tutor-sessions");
		Tutor t = (Tutor) session.getAttribute("tutor");
		List<TimeLedger> sessions = tlr.findByTutorId(t.getId());
		ArrayList<TimeLedger> filteredSessions = new ArrayList<>();
		for (TimeLedger x : sessions) {
			if (x.getSessionDate().isBefore(today)) {
				filteredSessions.add(x); 
			}
		}
		mv.addObject("sessions", filteredSessions);
		return mv;
	}
	
	//display all tutors current sessions
	@RequestMapping("new-tutor-sessions")
	public ModelAndView newTutorSessionDisplay(Tutor tutor) {
		ModelAndView mv = new ModelAndView("new-tutor-sessions");
		Tutor t = (Tutor) session.getAttribute("tutor");
		List<TimeLedger> sessions = tlr.findByTutorId(t.getId());
		ArrayList<TimeLedger> filteredSessions = new ArrayList<>();
		for (TimeLedger x : sessions) {
			if (x.getSessionDate().isEqual(today)) {
				filteredSessions.add(x); 
			}
		}
		mv.addObject("sessions", filteredSessions);
		return mv;
		
	}

	//display all students past sessions
	@RequestMapping("past-student-sessions")
	public ModelAndView studentSessionDisplay(Student student) {
		ModelAndView mv = new ModelAndView("past-student-sessions");
		Student s = (Student) session.getAttribute("student");
		List<TimeLedger> sessions = tlr.findByStudentId(s.getId());
		ArrayList<TimeLedger> filteredSessions = new ArrayList<>();
		for (TimeLedger x : sessions) {
			if (x.getSessionDate().isBefore(today)) {
				filteredSessions.add(x); 
			}
		}
		mv.addObject("sessions", filteredSessions);
		return mv;
	}
	
	//display all tutors current sessions
	@RequestMapping("new-student-sessions")
	public ModelAndView newStudentSessionDisplay(Student student) {
		ModelAndView mv = new ModelAndView("new-student-sessions");
		Student s = (Student) session.getAttribute("student");
		List<TimeLedger> sessions = tlr.findByStudentId(s.getId());
		ArrayList<TimeLedger> filteredSessions = new ArrayList<>();
		for (TimeLedger x : sessions) {
			if (x.getSessionDate().isEqual(today)) {
				filteredSessions.add(x); 
			}
		}
		mv.addObject("sessions", filteredSessions);
		return mv;
		
	}


	//logs student or tutor out and takes them back to log in page
	@RequestMapping("/logout")
	public ModelAndView logout() {
		//clears session memory when user logs out
		session.invalidate();
		return new ModelAndView("redirect:/");
	}

	//helper method to find the center between student and tutor
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

	//helper method to display info in popups about tutor
	public TutorMarks dataToTutorMarks(Tutor tutor) {
		Integer id = tutor.getId();
		String gName = tutor.getName();
		String subject = tutor.getSubject();
		String bio = tutor.getBio();
		String rating = tutor.getRating();
		double gLat = tutor.getLatitude();
		double gLng = tutor.getLongitude();
		return new TutorMarks(id, gName, subject, bio, rating, gLat, gLng);
	}

}
