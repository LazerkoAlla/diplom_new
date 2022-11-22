package by.iba.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Bonus {
    private int bonusID;
    private int bookID;
    private float bonus;
}
