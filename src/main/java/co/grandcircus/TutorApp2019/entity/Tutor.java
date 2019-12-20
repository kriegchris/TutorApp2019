package co.grandcircus.TutorApp2019.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Tutor implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="tutor_id")
	private Integer id;
	private String name;
	private Double latitude;
	private Double longitude;
	private String email;
	private String password;
	private String subject;
	private String bio;
	private Double rating;
	
	@OneToMany(mappedBy = "tutor", orphanRemoval=true)
	private List<Review> reviews;
	
	
	@OneToMany(mappedBy = "tutor", orphanRemoval=true)
	private List<TimeLedger> timeledger;
	
	
	public List<TimeLedger> getTimeledger() {
		return timeledger;
	}

	public void setTimeledgerTutor(List<TimeLedger> timeledgerTutor) {
		this.timeledger = timeledgerTutor;
	}

	public Tutor(Integer id, String name, Double latitude, Double longitude, String email, String password,
			String subject, String bio, Double rating, List<Review> reviews, List<TimeLedger> timeledgerTutor) {
		super();
		this.id = id;
		this.name = name;
		this.latitude = latitude;
		this.longitude = longitude;
		this.email = email;
		this.password = password;
		this.subject = subject;
		this.bio = bio;
		this.rating = rating;
		this.reviews = reviews;
		this.timeledger = timeledgerTutor;
	}

	public Tutor() {
		super();
	}

	public Tutor(Integer id, String name, Double latitude, Double longitude) {
		super();
		this.id = id;
		this.name = name;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public Tutor(String name, Double latitude, Double longitude) {
		super();
		this.name = name;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public Tutor(Integer id, String name, Double latitude, Double longitude, String email, String password,
			String subject, String bio, Double rating, List<Review> reviews) {
		super();
		this.id = id;
		this.name = name;
		this.latitude = latitude;
		this.longitude = longitude;
		this.email = email;
		this.password = password;
		this.subject = subject;
		this.bio = bio;
		this.rating = rating;
		this.reviews = reviews;
	}
	
	

	public Tutor(Integer id, String name, Double latitude, Double longitude, String email, String password,
			String subject, String bio) {
		super();
		this.id = id;
		this.name = name;
		this.latitude = latitude;
		this.longitude = longitude;
		this.email = email;
		this.password = password;
		this.subject = subject;
		this.bio = bio;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	public List<Review> getReview() {
		return reviews;
	}

	public void setReview(List<Review> reviews) {
		this.reviews = reviews;
	}

	//We need to update this after implementing AJAC
	@Override
	public String toString() {
		return  latitude + "," + longitude + "," + name;
	}
}
