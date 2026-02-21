package tech.csm.First_Assmnt_Aftr_Prjcts.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tech.csm.First_Assmnt_Aftr_Prjcts.entity.Season;

@Repository
public interface SeasonRepository extends JpaRepository<Season, Integer> {
}
