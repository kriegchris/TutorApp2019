package co.grandcircus.TutorApp2019.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class TimeLedger {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "session_id")
	private Integer id;
	private String meetingLocation;
	private String startTime;
	private Integer duration;
	
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "student_id", referencedColumnName = "student_id")
	private Student student;
	
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "tutor_id", referencedColumnName = "tutor_id")
	private Tutor tutor;
	
	public TimeLedger() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TimeLedger(Integer id, Student student, Tutor tutor, String meetingLocation, String startTime,
			Integer duration) {
		super();
		this.id = id;
		this.student = student;
		this.tutor = tutor;
		this.meetingLocation = meetingLocation;
		this.startTime = startTime;
		this.duration = duration;
	}

	public TimeLedger(Student student, Tutor tutor, String meetingLocation, String startTime, Integer duration) {
		super();
		this.student = student;
		this.tutor = tutor;
		this.meetingLocation = meetingLocation;
		this.startTime = startTime;
		this.duration = duration;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Tutor getTutor() {
		return tutor;
	}

	public void setTutor(Tutor tutor) {
		this.tutor = tutor;
	}

	public String getMeetingLocation() {
		return meetingLocation;
	}

	public void setMeetingLocation(String meetingLocation) {
		this.meetingLocation = meetingLocation;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	@Override
	public String toString() {
		return "TimeLedger [id=" + id + ", student=" + student + ", tutor=" + tutor + ", meetingLocation="
				+ meetingLocation + ", startTime=" + startTime + ", duration=" + duration + "]";
	}

}
