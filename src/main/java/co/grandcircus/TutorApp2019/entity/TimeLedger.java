package co.grandcircus.TutorApp2019.entity;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class TimeLedger {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "session_id")
	private Integer id;
	private String meetingLocation;
	private String startTime;
	private Integer duration;
	private Boolean completed;
	private LocalDate sessionDate;
	
	@ManyToOne
    @JoinColumn(name = "student_id", referencedColumnName = "student_id")
	private Student student;
	
	@ManyToOne
    @JoinColumn(name = "tutor_id", referencedColumnName = "tutor_id")
	private Tutor tutor;
	
	public TimeLedger() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public TimeLedger(Integer id, String meetingLocation, String startTime, Integer duration, Boolean completed,
			Student student, Tutor tutor, LocalDate sessionDate) {
		super();
		this.id = id;
		this.meetingLocation = meetingLocation;
		this.startTime = startTime;
		this.duration = duration;
		this.completed = completed;
		this.student = student;
		this.tutor = tutor;
		this.sessionDate = sessionDate;
	}

	public TimeLedger(Student student, Tutor tutor, String meetingLocation, String startTime, Integer duration,
			Boolean completed, LocalDate sessionDate) {
		super();
		this.meetingLocation = meetingLocation;
		this.startTime = startTime;
		this.duration = duration;
		this.completed = completed;
		this.student = student;
		this.tutor = tutor;
		this.sessionDate = sessionDate;
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

	public Boolean getCompleted() {
		return completed;
	}

	public void setCompleted(Boolean completed) {
		this.completed = completed;
	}

	public LocalDate getSessionDate() {
		return sessionDate;
	}

	public void setSessionDate(LocalDate sessionDate) {
		this.sessionDate = sessionDate;
	}

	@Override
	public String toString() {
		return "TimeLedger [id=" + id + ", meetingLocation=" + meetingLocation + ", startTime=" + startTime
				+ ", duration=" + duration + ", completed=" + completed + ", sessionDate=" + sessionDate + ", student="
				+ student + ", tutor=" + tutor + "]";
	}
	
	

}
