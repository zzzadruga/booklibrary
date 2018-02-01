package ru.zzzadruga.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.zzzadruga.dao.BookDAO;
import ru.zzzadruga.model.Book;

import java.util.List;

@Service
public class BookServiceImpl implements BookService{

    @Autowired
    private BookDAO bookDAO;

    public void addBook(Book book) {
        bookDAO.addBook(book);
    }

    public void updateBook(Book book) {
        bookDAO.updateBook(book);
    }

    public List<Book> listBooks() {
        return bookDAO.list();
    }

    public Book getBookById(int id) {
        return bookDAO.getBookById(id);
    }

    public void removeBook(int id) {
        bookDAO.removeBook(id);
    }
}
