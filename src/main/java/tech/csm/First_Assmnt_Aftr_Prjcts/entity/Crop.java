package tech.csm.First_Assmnt_Aftr_Prjcts.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="crop_master")
@Data
@NoArgsConstructor
@AllArgsConstructor

public class Crop {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="crop_id")
    private Integer cropId;

    @Column(name="crop_name", nullable = false)
    private String cropName;

    @ManyToOne
    @JoinColumn(name="season_id")
    private Season season;
}
