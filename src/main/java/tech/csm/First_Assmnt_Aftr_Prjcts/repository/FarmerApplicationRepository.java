package tech.csm.First_Assmnt_Aftr_Prjcts.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tech.csm.First_Assmnt_Aftr_Prjcts.entity.FarmerApplication;

@Repository
public interface FarmerApplicationRepository extends JpaRepository<FarmerApplication, Integer> {
//    check duplicate aadhaar for same crop
    boolean existsByAadhaarNoAndCropCropId(String aadhaarNo, Integer cropId);
}
