package by.iba.dao;


import by.iba.model.Orders;
import by.iba.util.ConnectorDB;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class OrdersDao {
    private static final Logger logger = LogManager.getLogger(OrdersDao.class);
    private final static String SQL_GET_ORDERS = "SELECT * FROM ORDERS";


    private static Connection connection;



    public OrdersDao() {
        try {
            if (connection == null) {
                connection = ConnectorDB.getConnection();
                logger.info("get connection");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void closeConnection() {
        try {
            if (connection != null) {
                connection.close();
                logger.info("close connection");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Orders> getOrders() { //все показывает
        List<Orders> orders = new LinkedList<Orders>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SQL_GET_ORDERS);

//            Orders order1 = null;
            while (resultSet.next()) {

                Orders order1 = new Orders();

                order1.setOrderID(resultSet.getInt("orderID"));
                order1.setBookID(resultSet.getInt("bookID"));
                order1.setCustomerID(resultSet.getInt("customerID"));
                order1.setOrderDate(resultSet.getInt("orderDate"));
                order1.setQuantity(resultSet.getInt("quantity"));
                order1.setTotal(resultSet.getInt("total"));
                orders.add(order1);
            }
            resultSet.close();
            statement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }


}
