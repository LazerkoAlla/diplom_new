package by.iba.servlet;

import by.iba.dao.BookDao;
import by.iba.model.Cart;
import by.iba.model.LineItem;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CartController", value = "/CartController")
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/shoppingcard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") != null) {
            Logger logger = LogManager.getLogger(CartController.class);

            Cart cart = (Cart) session.getAttribute("cart");
            if (request.getParameter("remove") != null) {

                LineItem item = cart.getItems().stream().filter(lineItem -> lineItem.getBookID() == Integer.parseInt(request.getParameter("bookID"))).collect(Collectors.toList()).get(0);
                cart.remove(item);
                session.setAttribute("cart", cart);

            } else if (request.getParameter("updateQuantity") != null) {
                int newUpdatedQuantity = Integer.parseInt(request.getParameter("updateQuantity"));
                logger.info("test - " +  newUpdatedQuantity);
                for (LineItem item : cart.getItems()) {
                    if (item.getBookID() == Integer.parseInt(request.getParameter("bookID"))) {
                        item.setQuantity(newUpdatedQuantity);
                        session.setAttribute("cart", cart);
                    }
                }
            }
            request.getRequestDispatcher("/WEB-INF/views/shoppingcard.jsp").forward(request, response);
        }else{
            response.sendRedirect("/WEB-INF/views/login.jsp");
        }

    }

}
