package tech.csm.First_Assmnt_Aftr_Prjcts.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "farmer_application",
        uniqueConstraints = {@UniqueConstraint(columnNames = {"aadhaarNo", "crop_id"})})

public class FarmerApplication {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="farmer_id")
    private Integer farmerId;

    @NotBlank(message = "Farmer Name is mandatory")
    @Size(max = 50)
    @Pattern(regexp = "^[a-zA-Z ]+$", message = "No special characters allowed")
    @Column(name="farmer_name")
    private String farmerName;

    @NotBlank(message = "Aadhaar is mandatory")
    @Size(min = 12, max = 12, message = "Aadhaar must be exactly 12 digits")
    @Pattern(regexp = "\\d{12}", message = "Numbers only")
    @Column(name="aadhar_no")
    private String aadhaarNo;

    @NotBlank(message = "Father Name is mandatory")
    @Size(max = 12)
    @Pattern(regexp = "^[a-zA-Z0-9 ]+$", message = "Alphanumeric only")
    @Column(name = "father_name")
    private String fatherName;

    @NotBlank(message = "Address is mandatory")
    @Size(max = 250)
    private String address;

    @NotBlank(message = "Category is mandatory")
    @Column(name="farmer_category")
    private String farmerCategory;

    @ManyToOne
    @JoinColumn(name = "season_id")
    private Season season;

    @ManyToOne
    @JoinColumn(name = "crop_id")
    private Crop crop;
}