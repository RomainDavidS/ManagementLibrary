package com.library.beans.mbooks.book;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;


@NoArgsConstructor
public  @Data class LanguageBean {

    private Long id;

    private String value;

    private List<BookBean> bookList;
}
