package com.library.controller.mbooks;

import com.library.beans.mbooks.book.BookBean;
import com.library.beans.mbooks.book.author.AuthorBean;

public interface IBookController {
    String getFullAuthorName(AuthorBean author);

    boolean isAvailability(BookBean book);
}