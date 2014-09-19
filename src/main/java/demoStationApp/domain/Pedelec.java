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
import javax.persistence.OneToOne;

/**
 * Created by swam on 07/08/14.
 */

@Entity
@ToString(includeFieldNames = true, exclude = {"slot"})
@EqualsAndHashCode(of = {"pedelecManufacturerId"})
@Getter
@Setter
public class Pedelec {

    @Id
    private String pedelecManufacturerId;
    private String pedelecErrorCode;
    private String pedelecErrorInfo;

    @Enumerated(EnumType.STRING)
    private OperationState pedelecState;
    @Enumerated(EnumType.STRING)
    private ChargingState chargingState;
    private Double meterValue;

    private Double maxCurrentValue;
    private Double maxBatteryLevel;

    private String owner;

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Battery battery;

    @JsonIgnore
    @OneToOne
    private Slot slot;
}
