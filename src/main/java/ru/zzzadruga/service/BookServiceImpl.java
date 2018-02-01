package ru.zzzadruga.service;

import org.springframework.beans.factory.annotation.Autowired;
import ru.zzzadruga.dao.BookDAO;
import ru.zzzadruga.model.Book;

import java.util.List;

public class BookServiceImpl implements BookService{

    @Autowired
    private BookDAO bookDAO;

    public List<Book> getAllBooks() {
        return bookDAO.getAllBooks();
    }
}
