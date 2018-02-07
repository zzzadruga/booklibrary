package ru.zzzadruga.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import ru.zzzadruga.repository.BookRepository;
import ru.zzzadruga.model.Book;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BookServiceImpl implements BookService{

    @Autowired
    private BookRepository bookRepository;

    private final static int PAGESIZE = 3;

    public void save(Book book) {
        bookRepository.save(book);
    }

    public Book getBookById(long id) {
        return bookRepository.findOne(id);
    }

    public void remove(long id) {
        bookRepository.delete(id);
    }

    public List<Book> getPage(int pageNumber) {
        PageRequest request = new PageRequest(pageNumber, PAGESIZE);
        return bookRepository.findAll(request).getContent();
    }
}
