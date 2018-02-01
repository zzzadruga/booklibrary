package ru.zzzadruga.model;

import lombok.*;

@Data
@AllArgsConstructor
public class Book {
    private int id;
    private String title;
    private String description;
    private String author;
    private String isbn;
    private int printYear;
    private boolean readAlready;
}
