package by.iba.dao;

import by.iba.model.Book;
import by.iba.util.ConnectorDB;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class BookDao {
    private static final Logger logger = LogManager.getLogger(BookDao.class);
    private final static String SQL_GET_BOOKS = "SELECT * FROM BOOKS";
    private final static String SQL_GET_BOOKS_BY_GENRE = "SELECT * FROM BOOKS WHERE genre = ?";
    private final static String SQL_INSERT_BOOKS = "INSERT INTO books (title, isbn, genre, price, rating, imageURL, description) VALUES (?, ?, ?, ?,?, ?, ?)";
    private final static String SQL_DELETE_BOOK_BY_ID = "DELETE FROM BOOKS WHERE bookID = ?";
    private final static String SQL_UPDATE_BOOK = "UPDATE BOOKS SET title = ?, isbn = ?, genre = ?, price = ?, rating = ?  WHERE bookID = ?";
    private final static String SQL_SEARCH_BOOKS_BY_TITLE = "SELECT * FROM BOOKS WHERE title LIKE ?";

    private static Connection connection;

    public BookDao() {
        try {
            if (connection == null) {
                connection = ConnectorDB.getConnection();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * This method adds the book to the shop
     * @param book
     * @return none
     */
    public void insertBook(Book book) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_INSERT_BOOKS);
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setString(2, book.getIsbn());
            preparedStatement.setString(3, book.getGenre());
            preparedStatement.setFloat(4, book.getPrice());
            preparedStatement.setFloat(5, book.getRating());
            preparedStatement.setString(6, book.getImageURL());
            preparedStatement.setString(7, book.getDescription());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * This method deletes the book from the shop
     * @param id
     * @return none
     */
    public void deleteBookById(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_DELETE_BOOK_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * This method updates data for one chosen book
     * @param book
     * @return none
     */
    public void updateBook(Book book) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_UPDATE_BOOK);
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setString(2, book.getIsbn());
            preparedStatement.setString(3, book.getGenre());
            preparedStatement.setFloat(4, book.getPrice());
            preparedStatement.setFloat(5, book.getRating());
            preparedStatement.setInt(6, book.getBookID());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * This method searches books by title
     * @param title
     * @return list of books List<Book>
     */
    public List<Book> searchBooksByTitle(String title) {
        List<Book> books = new LinkedList<>();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_SEARCH_BOOKS_BY_TITLE);
            preparedStatement.setString(1, "%" + title + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Book book = new Book();
                book.setBookID(resultSet.getInt("bookID"));
                book.setTitle(resultSet.getString("title"));
                book.setIsbn(resultSet.getString("isbn"));
                book.setGenre(resultSet.getString("genre"));
                book.setPrice(resultSet.getFloat("price"));
                book.setRating(resultSet.getFloat("rating"));
                book.setImageURL(resultSet.getString("imageURL"));
                book.setDescription(resultSet.getString("description"));
                books.add(book);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    /**
     * This method returns the list of all books in shop
     * @return list of books List<Book>
     */
    public List<Book> getBooks() {
        List<Book> books = new LinkedList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SQL_GET_BOOKS);
            while (resultSet.next()) {
                Book book = new Book();
                book.setBookID(resultSet.getInt("bookID"));
                book.setTitle(resultSet.getString("title"));
                book.setIsbn(resultSet.getString("isbn"));
                book.setGenre(resultSet.getString("genre"));
                book.setPrice(resultSet.getFloat("price"));
                book.setRating(resultSet.getFloat("rating"));
                book.setImageURL(resultSet.getString("imageURL"));
                book.setDescription(resultSet.getString("description"));
                books.add(book);
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    /**
     * This method returns the book by id
     * @return book
     */
    public Book getBookById(String bookId) {
        Book book = new Book();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM books WHERE bookID = " + bookId);
            resultSet.next();

            book.setBookID(resultSet.getInt("bookID"));
            book.setTitle(resultSet.getString("title"));
            book.setIsbn(resultSet.getString("isbn"));
            book.setGenre(resultSet.getString("genre"));
            book.setPrice(resultSet.getFloat("price"));
            book.setRating(resultSet.getFloat("rating"));
            book.setImageURL(resultSet.getString("imageURL"));
            book.setDescription(resultSet.getString("description"));

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    /**
     * This method searches books by genre
     * @param genre
     * @return list of books
     */
    public List<Book> searchBookByGenre(String genre) {
        List<Book> books = new LinkedList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_GET_BOOKS_BY_GENRE);
            preparedStatement.setString(1, genre);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Book book = new Book();
                book.setBookID(resultSet.getInt("bookID"));
                book.setTitle(resultSet.getString("title"));
                book.setIsbn(resultSet.getString("isbn"));
                book.setGenre(resultSet.getString("genre"));
                book.setPrice(resultSet.getFloat("price"));
                book.setRating(resultSet.getFloat("rating"));
                book.setImageURL(resultSet.getString("imageURL"));
                book.setDescription(resultSet.getString("description"));
                books.add(book);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }
}
