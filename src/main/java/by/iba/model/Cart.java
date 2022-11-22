package by.iba.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Cart implements Serializable {
    private List<LineItem> items;

    public Cart(List<LineItem> items) {
        this.items = items;
    }

    public Cart() {
        this.items = new ArrayList<>();
    }

    public List<LineItem> getItems() {
        return items;
    }

    public void setItems(List<LineItem> items) {
        this.items = items;
    }

    public void add(LineItem item) {
        //If the item already exists in the cart, only the quantity is changed.
        int code = item.getBookID();
        int quantity = item.getQuantity();
        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getBookID() == code) {
                lineItem.setQuantity(quantity);
                return;
            }
        }
        items.add(item);
    }

    // Used to empty cart after order has been processed
    public void removeAllItems() {
        items = new ArrayList<LineItem>();
    }

    public void remove(LineItem item) {
        int code = item.getBookID();
        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getBookID() == code) {
                items.remove(i);
                return;
            }
        }
    }
}
