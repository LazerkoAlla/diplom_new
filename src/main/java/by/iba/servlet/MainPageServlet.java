package by.iba.servlet;

import by.iba.dao.AuthorDao;
import by.iba.dao.BookDao;
import by.iba.model.Book;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MainPageServlet", value = "/MainPageServlet")
public class MainPageServlet extends HttpServlet {

    private static final Logger logger = LogManager.getLogger(MainPageServlet.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookDao daoBooks = new BookDao();
        String genre = request.getParameter("genre");
        if(genre != null){
            request.setAttribute("books", daoBooks.searchBookByGenre(genre));
        }else{
            request.setAttribute("books", daoBooks.getBooks());
        }
        request.getRequestDispatcher("/WEB-INF/views/mainPage.jsp")
            .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookDao daoBooks = new BookDao();
        String title = request.getParameter("title");
        logger.info(title);
        List<Book> books = daoBooks.searchBooksByTitle(title);
        request.setAttribute("books", books);
        request.getRequestDispatcher("/WEB-INF/views/mainPage.jsp")
            .forward(request, response);
    }
}
