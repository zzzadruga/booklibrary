package ru.zzzadruga.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.zzzadruga.dao.BookDAO;
import ru.zzzadruga.model.Book;

import java.util.List;


public interface BookService {
    List<Book> getAllBooks();
}
