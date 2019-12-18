package co.grandcircus.TutorApp2019.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.TutorApp2019.entity.Review;

public interface ReviewRepo extends JpaRepository<Review, Integer> {

	List<Review> findByTutorId(Integer id);
	
}
