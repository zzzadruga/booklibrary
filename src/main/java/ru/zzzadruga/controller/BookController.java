package ru.zzzadruga.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.zzzadruga.model.Book;
import ru.zzzadruga.service.BookService;

@Controller
@RequestMapping(value = {"/", "/books"})
public class BookController {

    @Autowired
    private BookService bookService;

    @RequestMapping(value = {"/", "/list"}, method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    public String booksList(@RequestParam(name = "s", defaultValue = "") String s,
                            @RequestParam(name = "p", defaultValue = "1") int pageNumber,
                            Model model) {
        s = s.trim();
        Page<Book> page = bookService.getPage(pageNumber - 1, s);
        int current = page.getNumber() + 1;
        int begin = Math.max(1, current - 5);
        int end = Math.min(begin + 10, page.getTotalPages());
        int totalPages = page.getTotalPages();
        model.addAttribute("bookModel", new Book());
        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("searchString", s);
        model.addAttribute("bookslist", page.getContent());
        return "books";
    }

    @RequestMapping(value = "/addBook", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public String addBook(@ModelAttribute("bookModel") Book book) {
        bookService.save(book);
        return "redirect:/books/list#list";
    }

    @RequestMapping(value = "/remove/{id}", produces = "text/plain;charset=UTF-8")
    public String removeBook(@PathVariable("id") long id) {
        bookService.remove(id);
        return "redirect:/books/list#list";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/plain;charset=UTF-8")
    public String editBook(@PathVariable("id") int id, Model model) {
        model.addAttribute("bookModel", bookService.getBookById(id));
        model.addAttribute("bookslist", bookService.getPage(0, null));
        return "books";
    }

    @RequestMapping(value = "/read/{id}", produces = "text/plain;charset=UTF-8")
    public String readBook(@PathVariable("id") int id) {
        Book book = bookService.getBookById(id);
        book.setReadAlready(true);
        bookService.save(book);
        return "redirect:/books/list#list";
    }
}
