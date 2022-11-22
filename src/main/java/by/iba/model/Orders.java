package by.iba.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Orders {
    private int orderID;
    private int bookID;
    private int customerID;
    private int orderDate;
    private int quantity;
    private int total;
}
