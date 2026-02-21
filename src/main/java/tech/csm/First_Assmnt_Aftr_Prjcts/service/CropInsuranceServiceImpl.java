package tech.csm.First_Assmnt_Aftr_Prjcts.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tech.csm.First_Assmnt_Aftr_Prjcts.entity.Crop;
import tech.csm.First_Assmnt_Aftr_Prjcts.entity.FarmerApplication;
import tech.csm.First_Assmnt_Aftr_Prjcts.entity.Season;
import tech.csm.First_Assmnt_Aftr_Prjcts.repository.CropRepository;
import tech.csm.First_Assmnt_Aftr_Prjcts.repository.FarmerApplicationRepository;
import tech.csm.First_Assmnt_Aftr_Prjcts.repository.SeasonRepository;

import java.util.List;

@Service
public class CropInsuranceServiceImpl implements CropInsuranceService {

    @Autowired
    private SeasonRepository seasonRepo;

    @Autowired
    private CropRepository cropRepo;

    @Autowired
    private FarmerApplicationRepository farmerRepo;

    @Override
    public List<Season> getAllSeasons() {
        return seasonRepo.findAll(); //  Season dropdown auto-populates
    }

    @Override
    public List<Crop> getCropsBySeason(Integer seasonId) {
        return cropRepo.findBySeasonSeasonId(seasonId); // Dynamic binding
    }

    @Override
    public String saveApplication(FarmerApplication application) {
        //  Checking for duplicate Aadhaar for the Same crop
        if (farmerRepo.existsByAadhaarNoAndCropCropId(application.getAadhaarNo(),
                application.getCrop().getCropId())) {
            return "Duplicate Aadhaar found for selected crop";
        }

        farmerRepo.save(application);
        return "Application submitted successfully.";
    }

    @Override
    public List<FarmerApplication> getAllApplications() {
        return farmerRepo.findAll();
    }

    @Override
    public void deleteApplication(Integer farmerId) {
        farmerRepo.deleteById(farmerId);
    }
}
