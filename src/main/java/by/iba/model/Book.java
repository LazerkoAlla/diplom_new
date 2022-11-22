package by.iba.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Book {
    private int bookID;
    private int authorID;
    private int publisherID;
    private String title;
    private String isbn;
    private String genre;
    private String imageURL;
    private float price;
    private float rating;
    private String description;

}
