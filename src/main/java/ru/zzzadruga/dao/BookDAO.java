package ru.zzzadruga.dao;

import ru.zzzadruga.model.Book;

import java.util.List;

public interface BookDAO {
    void addBook();
    void updateBook();
    List<Book> list();
    Book getBookById(int id);
    void removeBook(int id);
}
