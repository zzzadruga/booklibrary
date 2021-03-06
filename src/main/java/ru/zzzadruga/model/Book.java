package ru.zzzadruga.model;

import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;

import javax.persistence.*;

@Entity(name = "book")
@Table(name = "book")
@EqualsAndHashCode(of = "id")
@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
@DynamicUpdate
@DynamicInsert
@SelectBeforeUpdate
@ToString
public class Book{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String title;
    private String description;
    private String author;
    private String isbn;
    private Integer printYear;
    private boolean readAlready;
}
