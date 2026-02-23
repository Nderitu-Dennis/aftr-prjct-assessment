package tech.csm.First_Assmnt_Aftr_Prjcts.controller;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tech.csm.First_Assmnt_Aftr_Prjcts.entity.Crop;
import tech.csm.First_Assmnt_Aftr_Prjcts.entity.FarmerApplication;
import tech.csm.First_Assmnt_Aftr_Prjcts.service.CropInsuranceService;

import java.util.List;

@Controller
@RequestMapping("/insurance")
public class CropInsuranceController {

    @Autowired
    private CropInsuranceService insuranceService;

    // application form
    @GetMapping("/apply")
    public String showForm(Model model) {
        model.addAttribute("seasons", insuranceService.getAllSeasons());
        return "registration_form";
    }

    //  AJAX Endpoint for Dynamic Crop Loading
    @GetMapping("/getCrops")
    @ResponseBody
    public List<Crop> getCropsBySeason(@RequestParam("seasonId") Integer seasonId) {
        return insuranceService.getCropsBySeason(seasonId);
    }


    @PostMapping("/save")
    public String saveApplication(@Valid @ModelAttribute FarmerApplication application,
                                  BindingResult result, RedirectAttributes rd) {
        if (result.hasErrors()) {
            rd.addFlashAttribute("validationErrors", result.getAllErrors());
            return "redirect:/insurance/apply";
        }

        if(application.getCrop().getCropId() ==0){
        rd.addFlashAttribute("error","Select a valid crop" );
        return "redirect:/insurance/apply";
        }

        String message = insuranceService.saveApplication(application);
        if (message.contains("Duplicate")) {
            rd.addFlashAttribute("error", message);
            return "redirect:/insurance/apply";
        }

        rd.addFlashAttribute("msg", message);
        return "redirect:/insurance/view";
    }

    // application list
    @GetMapping("/view")
    public String viewApplications(Model model) {
        model.addAttribute("applications", insuranceService.getAllApplications());
        return "view_list";
    }

    @GetMapping("/delete")
    public String deleteApplication(@RequestParam("id") Integer farmerId, RedirectAttributes rd) {
        insuranceService.deleteApplication(farmerId);
        rd.addFlashAttribute("msg", "Application deleted successfully.");
        return "redirect:/insurance/view";
    }
}
