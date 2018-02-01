package ru.zzzadruga.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.zzzadruga.dao.BookDAO;
import ru.zzzadruga.model.Book;

import java.util.List;

@Service
@Transactional(transactionManager = "txManager")
public class BookServiceImpl implements BookService{

    @Autowired
    private BookDAO bookDAO;

    @Transactional
    public List<Book> getAllBooks() {
        return bookDAO.list();
    }
}
