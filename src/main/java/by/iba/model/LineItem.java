package by.iba.model;

import java.sql.SQLException;

import by.iba.dao.BookDao;
import java.io.Serializable;

public class LineItem implements Serializable{
    private int bookID;
    private String title;
    private int quantity;
    private float price;

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public LineItem(int bookID, String title, int quantity, int price) {
        this.bookID = bookID;
        this.title = title;
        this.price = price;
        this.quantity = quantity;
    }

    public LineItem() {
        this.bookID = 0;
        this.title = "";
        this.price = 0;
        this.quantity = 0;
    }

    public float getPrice() throws SQLException {
        float price = new BookDao().getBookById(String.valueOf(this.bookID)).getPrice();
        return price;
    }

    public float getTotalPrice() throws SQLException {
        return new BookDao().getBookById(String.valueOf(this.bookID)).getPrice() * this.quantity;
    }
}
