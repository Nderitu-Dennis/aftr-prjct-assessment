package tech.csm.First_Assmnt_Aftr_Prjcts.service;

import tech.csm.First_Assmnt_Aftr_Prjcts.entity.Crop;
import tech.csm.First_Assmnt_Aftr_Prjcts.entity.FarmerApplication;
import tech.csm.First_Assmnt_Aftr_Prjcts.entity.Season;

import java.util.List;

public interface CropInsuranceService {
    List<Season> getAllSeasons();
    List<Crop> getCropsBySeason(Integer seasonId);
    String saveApplication(FarmerApplication application);
    List<FarmerApplication> getAllApplications();
    void deleteApplication(Integer farmerId);
}
