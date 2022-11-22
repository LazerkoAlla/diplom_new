package by.iba.servlet;

import by.iba.dao.BookDao;
import by.iba.dao.BookRatingDao;
import by.iba.dao.ReviewDao;
import by.iba.model.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookDetailsServlet", value = "/BookDetailsServlet")
public class BookDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Book book = new BookDao().getBookById(id);
        float rating = new BookRatingDao().getBookRating(Integer.parseInt(id));
        book.setRating(rating);
        Integer userRating = new BookRatingDao().getUserRating(Integer.parseInt(id), (Integer)request.getSession().getAttribute("userId"));
        request.setAttribute("userRating", userRating);
        List<Review> reviews = new ReviewDao().getReviewsByBook(id);
        request.setAttribute("book", book);
        request.setAttribute("reviews", reviews);

        request.getRequestDispatcher("/WEB-INF/views/bookDetails.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String delete = request.getParameter("delete");
        String comment = request.getParameter("comment");
        String rating = request.getParameter("userRating");
        Integer bookID = request.getParameter("addBookToCart") != null ?
                Integer.parseInt(request.getParameter("addBookToCart"))
                : null;

        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if(bookID != null){
            LineItem lineItem = new LineItem();
            lineItem.setQuantity(1);
            lineItem.setTitle(new BookDao().getBookById(String.valueOf(bookID)).getTitle());
            lineItem.setBookID(bookID);
            if (cart == null) {
                cart = new Cart();
            }
            cart.add(lineItem);
            request.getSession().setAttribute("cart", cart);
        }else if (delete != null) {
            new ReviewDao().deleteReviewById(Integer.valueOf(delete));
        }
        else if(rating != null){
            BookRating bookRating = new BookRating();
            bookRating.setBookID(Integer.parseInt(request.getParameter("id")));
            bookRating.setUserID((Integer)request.getSession().getAttribute("userId"));
            bookRating.setRating(Integer.parseInt(rating));
            new BookRatingDao().insertBookRating(bookRating);
        }
        else if(comment != null){
            Review review = new Review();
            review.setCommentText(comment);
            review.setUserId((Integer)request.getSession().getAttribute("userId"));
            review.setBookID(Integer.parseInt(request.getParameter("id")));
            Logger logger = LogManager.getLogger(BookDetailsServlet.class);
            logger.info(request.getSession().getAttribute("login"));
            review.setReviewerName((String) request.getSession().getAttribute("login"));
            new ReviewDao().insertReview(review);
        }

        response.sendRedirect(request.getRequestURI() + "?id=" + request.getParameter("id"));
    }
}
