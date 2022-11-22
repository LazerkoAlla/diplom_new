package by.iba.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
    private int reviewID;
    private int userId;
    private int bookID;
    private String commentText;
    private String reviewerName;
}
