package by.iba.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Delivery {
    private int orderID;
    private int customerID;
    private String deliveryDate;
}
