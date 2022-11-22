package by.iba.dao;

import by.iba.model.User;
import by.iba.util.ConnectorDB;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class UserDao {

    private final static String SQL_GET_USER_BY_LOGIN_AND_PASSWORD = "SELECT * FROM USERS WHERE login = ? and password = ? and isBlocked != TRUE";
    private final static String SQL_CHECK_LOGIN = "SELECT login FROM users WHERE login = ?";
    private final static String SQL_INSERT_USER = "INSERT INTO users(login ,password, isBlocked) VALUES (? , ?, false)";
    private final static String SQL_CHANGE_PASS = "update users set password = ? where login= ?";
    private final static String SQL_CHANGE_USER_BLOCK_STATUS = "UPDATE USERS SET isBlocked = ? WHERE id = ?";
    private final static String SQL_GET_USER_LIST = "SELECT * FROM USERS";
    private Connection connection;

    public UserDao() {
        try {
            connection = ConnectorDB.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * This method checks whether such user exists in the system (also whether user shouldn't be blocked in the system)
     * @param login user login
     * @param password user password
     * @return user if he exists
     */
    public User getUser(String login, String password) {
        User user = new User();
        try {
            PreparedStatement ps = connection.prepareStatement(SQL_GET_USER_BY_LOGIN_AND_PASSWORD);
            ps.setString(1, login);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user.setId(rs.getInt("id"));
                user.setLogin(rs.getString("login"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user.getLogin() != null ? user : null;
    }

    public boolean insertUser(User user) {
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement(SQL_CHECK_LOGIN); preparedStatement.setString(1, user.getLogin());
                    ResultSet result = preparedStatement.executeQuery();
            if ( result.next()){ preparedStatement.close(); return false;
            }
            else {
                preparedStatement = connection.prepareStatement(SQL_INSERT_USER);

                preparedStatement.setString(1, user.getLogin());
                preparedStatement.setString(2, user.getPassword());

                preparedStatement.executeUpdate(); preparedStatement.close();

            }
        } catch (SQLException e) { e.printStackTrace();
        }
        return true;
    }

    public boolean changePass(User user) {
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement(SQL_CHANGE_PASS);
            preparedStatement.setString(1, user.getPassword());
            preparedStatement.setString(2, user.getLogin());

            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    /**
     * This method returns all shop users
     * @return list of shop users
     */
    public List<User> getUsers() {
        List<User> users = new LinkedList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SQL_GET_USER_LIST);
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setRole(resultSet.getInt("role"));
                user.setLogin(resultSet.getString("login"));
                user.setFirstName(resultSet.getString("firstName"));
                user.setLastName(resultSet.getString("lastName"));
                user.setBlocked(resultSet.getBoolean("isBlocked"));
                users.add(user);
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    /**
     * This method changes the status of user to blocked or unblocked
     * @param id
     * @param isBlocked
     * @return none
     */
    public void changeUserBlockStatus(int id, boolean isBlocked) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_CHANGE_USER_BLOCK_STATUS);
            preparedStatement.setBoolean(1, isBlocked);
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}