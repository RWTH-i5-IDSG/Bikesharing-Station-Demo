package demoStationApp.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

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
    private String pedelecInfo;
    private String pedelecState;
    private String chargingState;
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
