package com.admiralxy.cinema.entities;

import lombok.*;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "sessions")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Session extends BaseEntity {

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "hall_id", nullable = false)
    private Hall hall;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "film_id", nullable = false)
    private Film film;

    @Column(name = "start_at", nullable = false)
    private Date startAt;

    @Column(name = "cost", nullable = false, precision = 10, scale = 2)
    private BigDecimal cost;

}