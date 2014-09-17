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
import javax.persistence.OneToMany;
import java.util.List;

/**
 * Created by swam on 07/08/14.
 */

@Entity
@ToString(includeFieldNames = true)
@EqualsAndHashCode(of = {"stationManufacturerId"})
@Getter
@Setter
public class Station {

    @Id
    private String stationManufacturerId;
    private String firmwareVersion;
    private String stationErrorCode;
    private String stationInfo;

    @Enumerated(EnumType.STRING)
    private OperationState stationState;

    private Integer heartbeatInterval;
    @JsonIgnore
    private String cmsURI;
    @JsonIgnore
    private Integer openSlotTimeout;
    @JsonIgnore
    private Integer rebootRetries;
    @JsonIgnore
    private Integer chargingStatusInformInterval;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Slot> slots;

}
