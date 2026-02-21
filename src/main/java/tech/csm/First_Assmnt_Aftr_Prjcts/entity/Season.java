package tech.csm.First_Assmnt_Aftr_Prjcts.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="season_master")
@Data
@NoArgsConstructor
@AllArgsConstructor

public class Season {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="season_id")
    private Integer seasonId;

    @Column(name = "season_name")
    private String seasonName;
}
