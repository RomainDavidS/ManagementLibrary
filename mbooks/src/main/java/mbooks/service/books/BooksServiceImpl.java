package mbooks.service.books;


import mbooks.exceptions.ResourceNotFoundException;
import mbooks.model.books.Books;
import mbooks.repository.book.IBooksRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BooksServiceImpl implements IBooksService {

    @Autowired
    private IBooksRepository bookRepository;

    public Books find(Long id){
        return bookRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Livre non trouvé avec l'id " + id ) );
    }

    public List<Books> list(){
        return bookRepository.findAll();
    }

    public Books  save(Books book){ return bookRepository.save( book ); }

    public boolean delete(Long id){
        try {
            bookRepository.deleteById( id );
            return true;
        }catch (DataIntegrityViolationException ee){
            return false;
        }
    }
}
