package by.iba.servlet;

import by.iba.dao.BookDao;
import by.iba.dao.UserDao;
import by.iba.model.Book;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminPanelServlet", value = "/AdminPanelServlet")
public class AdminPanelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("books", new BookDao().getBooks());
        request.setAttribute("users", new UserDao().getUsers());
        request.getRequestDispatcher("/WEB-INF/views/adminPage.jsp")
            .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("delete") != null) {
            deleteBookFromShop(request);
        }else if(request.getParameter("add") != null){
            addBookToShop(request);
        }else if(request.getParameter("block") != null){
//            Logger logger = LogManager.getLogger(AdminPanelServlet.class);
//            logger.info(Boolean.parseBoolean(request.getParameter("block")));
//            logger.info(request.getParameter("block"));
            blockOrUnblockUser(request);
        }

        request.setAttribute("books", new BookDao().getBooks());
        request.setAttribute("users", new UserDao().getUsers());
        request.getRequestDispatcher("/WEB-INF/views/adminPage.jsp")
            .forward(request, response);
    }

    private void addBookToShop(HttpServletRequest request){
        String title = request.getParameter("title");
        String isbn = request.getParameter("isbn");
        String genre = request.getParameter("genre");
        float price = Float.parseFloat(request.getParameter("price"));
        float rating = Float.parseFloat(request.getParameter("rating"));
        String imageURL = request.getParameter("imageURL");
        String description = request.getParameter("description");

        Book book = new Book();
        book.setTitle(title);
        book.setIsbn(isbn);
        book.setGenre(genre);
        book.setPrice(price);
        book.setRating(rating);
        book.setImageURL(imageURL);
        book.setDescription(description);

        new BookDao().insertBook(book);
    }
    private void deleteBookFromShop(HttpServletRequest request){
        new BookDao().deleteBookById(
                Integer.parseInt(request.getParameter("delete"))
        );
    }
    private void blockOrUnblockUser(HttpServletRequest request){
        new UserDao().changeUserBlockStatus(
                Integer.parseInt(request.getParameter("id")),
                Boolean.parseBoolean(request.getParameter("block"))
        );
    }
}
