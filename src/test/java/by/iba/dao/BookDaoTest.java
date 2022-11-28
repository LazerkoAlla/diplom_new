package by.iba.dao;

import by.iba.model.Book;
import org.junit.Assert;
import org.junit.jupiter.api.Test;

import java.util.List;

class BookDaoTest {

    @Test
    void searchBooksByTitle() {

            BookDao cd = new BookDao();
            String key = "war";
            List<Book> listBook = cd.searchBooksByTitle(key);
            Assert.assertNotNull(listBook);
            Assert.assertEquals(0, listBook.size());

            key = "Jane Eyre";
            listBook = cd.searchBooksByTitle(key);
            Assert.assertNotNull(listBook);
            Assert.assertEquals(1, listBook.size());
            for(int i=0; i<listBook.size(); i++){
                Assert.assertTrue(listBook.get(i).getTitle().toLowerCase().contains(key.toLowerCase()));
            }

            key = "Ja";
            listBook = cd.searchBooksByTitle(key);
            Assert.assertNotNull(listBook);
            Assert.assertEquals(2, listBook.size());
            for(int i=0; i<listBook.size(); i++){
                Assert.assertTrue(listBook.get(i).getTitle().toLowerCase().contains(key.toLowerCase()));
            }
            return;
        }


    @Test
    void searchBookByGenre() {

        BookDao cd = new BookDao();
        String key = "detective";
        List<Book> listBook = cd.searchBookByGenre(key);
        Assert.assertNotNull(listBook);
        Assert.assertEquals(2, listBook.size());

        key = "children";
        listBook = cd.searchBookByGenre(key);
        Assert.assertNotNull(listBook);
        Assert.assertEquals(2, listBook.size());
        return;
    }
}