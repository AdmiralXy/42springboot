package com.admiralxy.cinema.entities;

import lombok.*;
import javax.persistence.*;

@Entity
@Table(name = "images")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Image extends BaseEntity {

    @Column(name = "data")
    private Byte[] data;

}