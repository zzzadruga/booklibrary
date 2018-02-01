package ru.zzzadruga.dao;

import org.springframework.stereotype.Repository;
import ru.zzzadruga.model.Book;

import java.util.ArrayList;
import java.util.List;

@Repository
public class BookDAOImpl implements BookDAO {
    public List<Book> getAllBooks() {
        List<Book> list = new ArrayList<Book>();
        list.add(new Book(
                1,
                "Зеленая миля",
                "Роман-событие, ставший лауреатом премии Брэма Стокера и вдохновивший Фрэнка Дарабонта на создание культового фильма, в котором Том Хэнкс сыграл, возможно, свою лучшую роль.",
                "Стивен Кинг",
                "978-5-17-103631-7",
                2017, false));
        list.add(new Book(
                2,
                "Гарри Поттер и узник Азкабана",
                "«Добро пожаловать в «ГрандУлет», спасательный экипаж для колдунов и ведьм, оказавшихся в затруднительном положении.",
                "Дж. К. Роулинг",
                "978-1-78110-190-2",
                2017, false));
        return list;
    }
}
