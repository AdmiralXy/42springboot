package com.admiralxy.cinema.entities;

import lombok.*;
import javax.persistence.*;
import java.util.Date;
import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "messages")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Message extends BaseEntity {

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "film_id", nullable = false)
    private Film film;

    @Column(name = "username", nullable = false)
    private String username;

    @Lob
    @Column(name = "message", nullable = false, length = 20000)
    private String message;

    @Column(name = "created_at", nullable = false)
    @CreationTimestamp
    private Date createdAt;

}