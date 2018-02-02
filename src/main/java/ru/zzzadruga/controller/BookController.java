package ru.zzzadruga.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.zzzadruga.model.Book;
import ru.zzzadruga.service.BookService;

@Controller
@RequestMapping("/books")
public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping(value = "/list", method = RequestMethod.GET, headers = "Accept=application/json")
    public String booksList(Model model) {
        model.addAttribute("bookModel", new Book());
        model.addAttribute("bookslist", bookService.listBooks());
        return "books";
    }

    @RequestMapping(value = "/addBook", method = RequestMethod.POST, headers = "Accept=application/json")
    public String addBook(@ModelAttribute("bookModel") Book book) {
        System.out.println(book.toString());
        if (book.getId () == 0) { bookService.addBook(book);  }
        else { bookService.updateBook(book); }
        return "redirect:/books/list";
    }

    @RequestMapping(value = "/remove/{id}")
    public String removeBook(@PathVariable("id") int id) {
        bookService.removeBook(id);
        return "redirect:/books/list";
    }
}
