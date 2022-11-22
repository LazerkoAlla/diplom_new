package by.iba.dao;

import by.iba.model.Review;
import by.iba.util.ConnectorDB;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class ReviewDao {
    private static final Logger logger = LogManager.getLogger(ReviewDao.class);
    private final static String SQL_GET_REVIEW_BY_BOOK = "SELECT * FROM Review WHERE BookID = ";
    private final static String SQL_DELETE_REVIEW_FOR_BOOK= "DELETE FROM Review WHERE reviewID = ?";
    private final static String SQL_INSERT_REVIEW_FOR_BOOK = "INSERT INTO Review(userID, bookID, commentText, reviewerName) VALUES (?, ?, ?, ?)";

    private static Connection connection;

    public ReviewDao() {
        try {
            if (connection == null) {
                connection = ConnectorDB.getConnection();
                logger.info("get connection");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * This method returns list of reviews for the book
     * @param bookId
     * @return list of reviews for direct book
     */
    public List<Review> getReviewsByBook(String bookId) {
        List<Review> reviews = new LinkedList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SQL_GET_REVIEW_BY_BOOK + bookId);

            while (resultSet.next()) {
                Review review = new Review();
                review.setReviewID(resultSet.getInt("reviewId"));
                review.setCommentText(resultSet.getString("commentText"));
                review.setReviewerName(resultSet.getString("reviewerName"));
                reviews.add(review);
            }
            resultSet.close();
            statement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    /**
     * This method deletes review for the book
     * @param reviewId
     * @return none
     */
    public void deleteReviewById(int reviewId){
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_DELETE_REVIEW_FOR_BOOK);
            preparedStatement.setInt(1, reviewId);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * This method inserts review for the book from authorized user
     * @param review
     */
    public void insertReview(Review review) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_INSERT_REVIEW_FOR_BOOK);
            preparedStatement.setInt(1, review.getUserId());
            preparedStatement.setInt(2, review.getBookID());
            preparedStatement.setString(3, review.getCommentText());
            preparedStatement.setString(4, review.getReviewerName());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }








}
