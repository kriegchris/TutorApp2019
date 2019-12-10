package co.grandcircus.TutorApp2019.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.TutorApp2019.entity.TimeLedger;

public interface TimeLedgerRepo extends JpaRepository<TimeLedger, Integer> {

}
