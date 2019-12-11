package co.grandcircus.TutorApp2019.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.TutorApp2019.entity.TimeLedger;

public interface TimeLedgerRepo extends JpaRepository<TimeLedger, Integer> {
	
//	List<TimeLedger> findByIdEquals(Integer id);

}
