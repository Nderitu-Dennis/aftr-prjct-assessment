package tech.csm.First_Assmnt_Aftr_Prjcts.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tech.csm.First_Assmnt_Aftr_Prjcts.entity.Crop;

import java.util.List;

@Repository
public interface CropRepository extends JpaRepository<Crop,Integer> {
//    bind crop dropdown dynamically with season
    List<Crop> findBySeasonSeasonId(Integer seasonId);
}
