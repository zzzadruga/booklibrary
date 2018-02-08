package ru.zzzadruga.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import ru.zzzadruga.model.Book;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Long> {
    Page<Book> findBooksByAuthorLike(String searchString, Pageable pageable);
}
