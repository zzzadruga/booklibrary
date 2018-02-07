package ru.zzzadruga.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import ru.zzzadruga.model.Book;

public interface BookRepository extends PagingAndSortingRepository<Book, Long> {
}
