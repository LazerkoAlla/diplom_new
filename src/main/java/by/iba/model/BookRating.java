package by.iba.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookRating {
    private int bookID;
    private int userID;
    private int rating;
}
