package demoStationApp.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

/**
 * Created by swam on 07/08/14.
 */

@Entity
@ToString(includeFieldNames = true, exclude = {"station"})
@EqualsAndHashCode(of = {"slotManufacturerId"})
@Getter
@Setter
public class Slot {

    @Id
    private String slotManufacturerId;
    private Integer slotPosition;
    private String slotErrorCode;
    private String slotInfo;

    @Enumerated(EnumType.STRING)
    private OperationState slotState;

    @JsonIgnore
    @ManyToOne
    private Station station;
    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "slot")
    private Pedelec pedelec;
}
