package ru.zzzadruga.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.zzzadruga.model.Book;
import ru.zzzadruga.service.BookService;

@Controller
@RequestMapping(value = {"/", "/books"})
public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping(value = {"/", "/list"}, method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    public String booksList(Model model) {
        model.addAttribute("bookModel", new Book());
        model.addAttribute("bookslist", bookService.listBooks(""));
        return "books";
    }

    @RequestMapping(value = {"/search"}, method = RequestMethod.GET)
    public String search(@RequestParam String s, Model model) {
        System.out.println(s);
        model.addAttribute("bookModel", new Book());
        model.addAttribute("bookslist", this.bookService.listBooks(s));
        return "books";
    }

    @RequestMapping(value = "/addBook", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public String addBook(@ModelAttribute("bookModel") Book book) {
        System.out.println(book.toString());
        if (book.getId () == 0) { bookService.addBook(book);  }
        else {bookService.updateBook(book); }
        return "redirect:/books/list#list";
    }

    @RequestMapping(value = "/remove/{id}", produces = "text/plain;charset=UTF-8")
    public String removeBook(@PathVariable("id") int id) {
        bookService.removeBook(id);
        return "redirect:/books/list#list";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/plain;charset=UTF-8")
    public String editBook(@PathVariable("id") int id, Model model) {
        model.addAttribute("bookModel", bookService.getBookById(id));
        model.addAttribute("bookslist", bookService.listBooks(""));
        return "books";
    }

    @RequestMapping(value = "/read/{id}", produces = "text/plain;charset=UTF-8")
    public String readBook(@PathVariable("id") int id) {
        Book book = bookService.getBookById(id);
        book.setReadAlready(true);
        bookService.updateBook(book);
        return "redirect:/books/list#list";
    }
}
