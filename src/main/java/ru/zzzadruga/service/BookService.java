package ru.zzzadruga.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import ru.zzzadruga.model.Book;

import java.util.List;

public interface BookService {
    void save(Book book);
    Book getBookById(long id);
    void remove(long id);
    Page<Book> getPage(int pageNumber, String searchString);
}
