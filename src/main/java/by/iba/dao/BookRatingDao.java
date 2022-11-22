package by.iba.dao;

import by.iba.model.Book;
import by.iba.model.BookRating;
import by.iba.util.ConnectorDB;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class BookRatingDao {

    private final static String SQL_BOOK_RATING = "SELECT AVG(rating) AS users_rating FROM book_rating WHERE bookID = ?";
    private final static String SQL_BOOK_RATING_BY_USER = "SELECT rating FROM book_rating WHERE bookID = ? AND userID = ?";
    private final static String SQL_BOOK_RATING_INSERT = "INSERT book_rating(bookID, userID, rating) VALUES (?, ?, ?)";
    private final static String SQL_BOOK_RATING_UPDATE = "UPDATE book_rating SET rating = ? WHERE bookID = ? AND userID = ?";

    private static Connection connection;

    public BookRatingDao() {
        try {
            if (connection == null) {
                connection = ConnectorDB.getConnection();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * This method inserts book rating of the user to DB
     * @param bookRating book rating data for DB insert
     */
    public void insertBookRating(BookRating bookRating) {

        if(getUserRating(bookRating.getBookID(), bookRating.getUserID()) != null){
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(SQL_BOOK_RATING_UPDATE);
                preparedStatement.setInt(1, bookRating.getRating());
                preparedStatement.setInt(2, bookRating.getBookID());
                preparedStatement.setInt(3, bookRating.getUserID());
                preparedStatement.executeUpdate();
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else{
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(SQL_BOOK_RATING_INSERT);
                preparedStatement.setInt(1, bookRating.getBookID());
                preparedStatement.setInt(2, bookRating.getUserID());
                preparedStatement.setInt(3, bookRating.getRating());
                preparedStatement.executeUpdate();
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * This method returns average users rating for the book
     * @param bookID book id
     * @return book rating
     */
    public Float getBookRating(int bookID) {
        Float usersRating = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_BOOK_RATING);
            preparedStatement.setInt(1, bookID);
            ResultSet rs = preparedStatement.executeQuery();
            rs.next();
            usersRating = rs.getFloat("users_rating");
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usersRating;
    }

    public Integer getUserRating(int bookID, int userID) {
        Integer userRating = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_BOOK_RATING_BY_USER);
            preparedStatement.setInt(1, bookID);
            preparedStatement.setInt(2, userID);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                userRating = rs.getInt("rating");
            }
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userRating;
    }

}
