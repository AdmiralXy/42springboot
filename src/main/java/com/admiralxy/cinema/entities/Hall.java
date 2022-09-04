package com.admiralxy.cinema.entities;

import lombok.*;
import javax.persistence.*;

@Entity
@Table(name = "halls")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Hall extends BaseEntity {

    @Column(name = "serial", nullable = false)
    private Integer serial;

    @Column(name = "seats", nullable = false)
    private Integer seats;

}