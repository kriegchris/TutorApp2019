package co.grandcircus.TutorApp2019.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.TutorApp2019.entity.Student;

public interface StudentRepo extends JpaRepository<Student, Integer> {

}
