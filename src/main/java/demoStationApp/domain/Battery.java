package demoStationApp.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by swam on 07/08/14.
 */

@Entity
@ToString(includeFieldNames = true)
@EqualsAndHashCode(of = {"batteryId"})
@Getter
@Setter
public class Battery {
    @JsonIgnore
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long batteryId;

    private Double soc;
    private Double temperature;
    private Long cycleCount;
    private Double voltage;
    private Double current;

}
