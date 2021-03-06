package ru.zzzadruga.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import ru.zzzadruga.model.Book;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Long> {
    Page<Book> findBooksByAuthorLikeOrTitleLike(String searchAuthorString, String searchTitleString,Pageable pageable);
}
