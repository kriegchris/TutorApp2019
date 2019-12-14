package co.grandcircus.TutorApp2019.repo;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.TutorApp2019.entity.Tutor;

public interface TutorRepo extends JpaRepository<Tutor, Integer> {
	
	Tutor findByEmail(String email); 
	Tutor findByName(String name);
	ArrayList<Tutor> findBySubject(String subject);

}
