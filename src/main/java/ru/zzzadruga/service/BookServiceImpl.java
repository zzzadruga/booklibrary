package ru.zzzadruga.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import ru.zzzadruga.repository.BookRepository;
import ru.zzzadruga.model.Book;

@Service
public class BookServiceImpl implements BookService{

    @Autowired
    private BookRepository bookRepository;

    private final static int PAGESIZE = 10;

    public void save(Book book) {
        bookRepository.save(book);
    }

    public Book getBookById(long id) {
        return bookRepository.findOne(id);
    }

    public void remove(long id) {
        bookRepository.delete(id);
    }

    public Page<Book> getPage(int pageNumber, String searchString) {
        PageRequest request = new PageRequest(pageNumber, PAGESIZE);
        Page<Book> page = (searchString != null ? bookRepository.findBooksByAuthorLikeOrTitleLike("%" + searchString + "%", "%" + searchString + "%", request) : bookRepository.findAll(request));
        return page;
    }

}
