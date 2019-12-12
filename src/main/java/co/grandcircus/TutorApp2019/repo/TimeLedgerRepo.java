package co.grandcircus.TutorApp2019.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.TutorApp2019.entity.Student;
import co.grandcircus.TutorApp2019.entity.TimeLedger;
import co.grandcircus.TutorApp2019.entity.Tutor;

public interface TimeLedgerRepo extends JpaRepository<TimeLedger, Integer> {
	
	List<TimeLedger> findByStudentId(Integer studentId);
	List<TimeLedger> findByTutorId(Integer tutorId);
		
	

}
