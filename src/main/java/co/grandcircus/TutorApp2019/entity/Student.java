package co.grandcircus.TutorApp2019.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Student {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="student_id")
	private Integer id;
	private String name;
	private String email;
	private String password;
//	private Double latitude;
//	private Double longitude;
	
	@OneToOne(mappedBy = "student")
	private TimeLedger timeledger;

	public Student() {
		super();
	}

	public Student(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Student(Integer id, String name, String email, String password) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
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

	public Student(Integer id, String name, String email, String password, TimeLedger timeledgerStudent) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.timeledger = timeledgerStudent;
	}

	public TimeLedger getTimeledgerStudent() {
		return timeledger;
	}

	public void setTimeledgerStudent(TimeLedger timeledgerStudent) {
		this.timeledger = timeledgerStudent;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + "]";
	}
}
