package ru.zzzadruga.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import ru.zzzadruga.model.Book;
import ru.zzzadruga.service.BookService;

import java.util.List;

@Controller
@RequestMapping("/books")
public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public String homepage(Model model) {
        List<Book> books = this.bookService.getAllBooks();
        model.addAttribute("books", books);
        return "books";
    }
}
