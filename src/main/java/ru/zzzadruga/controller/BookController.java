package ru.zzzadruga.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.zzzadruga.model.Book;
import ru.zzzadruga.service.BookService;

import java.util.List;

@Controller
@RequestMapping("/books")
public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView booksList() {
        ModelAndView modelAndView = new ModelAndView("books");
        modelAndView.addObject("bookslist", bookService.listBooks());
        return modelAndView;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView bookAdd() {
        ModelAndView modelAndView = new ModelAndView("add");
        modelAndView.addObject("addBook", new Book());
        return modelAndView;
    }

    @RequestMapping(value = "/check", method = RequestMethod.POST)
    @ResponseBody
    public String checkBook(@ModelAttribute("addBook") Book book) {
        String info;
        if (book.getId() == 0) {
            bookService.addBook(book);
            info = "added";
        } else {
            bookService.updateBook(book);
            info = "updated";
        }
        return "book " + info;
    }
}
