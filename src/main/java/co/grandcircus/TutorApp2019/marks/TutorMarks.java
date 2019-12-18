package co.grandcircus.TutorApp2019.marks;

import co.grandcircus.TutorApp2019.marks.GoogleMarks;

public class TutorMarks extends GoogleMarks {
	
	private Integer id;
	private String name;
	private String bio;
	private Double rating;
	private String subject;
	private double lat;
	private double lng;
	
	public TutorMarks() {
	}

	public TutorMarks(String name, double lat, double lng) {
		super();
		this.name = name;
		this.lat = lat;
		this.lng = lng;
	}

	public TutorMarks(Integer id, String name, String bio, Double rating, String subject, double lat, double lng) {
		super();
		this.id = id;
		this.name = name;
		this.bio = bio;
		this.rating = rating;
		this.subject = subject;
		this.lat = lat;
		this.lng = lng;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}


	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public Double getRating() {
		return rating;
	}

	public void setRating(Double rating) {
		this.rating = rating;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "[\"" + id + "\", " + "\"" + name + "\", " + "\"" + rating + "\", " + "\"" + subject + "\", "  + "\"" + bio + "\", " + lat + ", " + lng + "]";
	}

}