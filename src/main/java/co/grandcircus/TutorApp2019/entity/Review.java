package co.grandcircus.TutorApp2019.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Review {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="review_id")
	private Integer id;
	private String review;
	
	@ManyToOne
	@JoinColumn(name = "tutor_id", referencedColumnName = "tutor_id")
	private Tutor tutor;
	
	@ManyToOne
	@JoinColumn(name = "student_id", referencedColumnName = "student_id")
	private Student student;

	public Review() {
	}

	public Review(Integer id, String review, Tutor tutor, Student student) {
		super();
		this.id = id;
		this.review = review;
		this.tutor = tutor;
		this.student = student;
	}
	
	public Review(String review, Tutor tutor, Student student) {
		super();
		this.review = review;
		this.tutor = tutor;
		this.student = student;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Tutor getTutor() {
		return tutor;
	}

	public void setTutor(Tutor tutor) {
		this.tutor = tutor;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	@Override
	public String toString() {
		return "Review [id=" + id + ", review=" + review + ", tutor=" + tutor + ", student=" + student + "]";
	}
	
}
