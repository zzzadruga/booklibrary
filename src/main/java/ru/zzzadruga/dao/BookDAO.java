package ru.zzzadruga.dao;

import ru.zzzadruga.model.Book;

import java.util.List;

public interface BookDAO {
    void addBook(Book book);
    void updateBook(Book book);
    List<Book> list();
    Book getBookById(int id);
    void removeBook(int id);
}
