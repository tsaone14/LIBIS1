package com.example.libis1.controller;

import com.example.libis1.model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

// One controller, two URLs: /catalogue (list + search) and /book?id=N (book details)
@WebServlet(name = "catalogueController", urlPatterns = {"/catalogue", "/book"})
public class CatalogueController extends HttpServlet {

    private static final String CATALOGUE_VIEW = "/WEB-INF/views/welcome.jsp";
    private static final String BOOK_VIEW = "/WEB-INF/views/book.jsp";

    @Override
    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Book> allBooks = (List<Book>) session.getAttribute(loginController.SESSION_BOOKS);

        request.setAttribute("member", session.getAttribute(loginController.SESSION_MEMBER));

        if ("/book".equals(request.getServletPath())) {
            showBookDetails(request, response, allBooks);
        } else {
            showCatalogue(request, response, allBooks);
        }
    }


    private void showCatalogue(HttpServletRequest request, HttpServletResponse response, List<Book> allBooks)
            throws ServletException, IOException {

        String term = request.getParameter("q");
        List<Book> results = new ArrayList<>();

        if (term == null || term.isBlank()) {
            term = "";
            results.addAll(allBooks);
        } else {
            term = term.trim();
            String needle = term.toLowerCase();
            for (Book book : allBooks) {
                if (book.getTitle().toLowerCase().contains(needle)) {
                    results.add(book);
                }
            }
        }

        request.setAttribute("books", results);
        request.setAttribute("searchTerm", term);
        request.getRequestDispatcher(CATALOGUE_VIEW).forward(request, response);
    }

    // ---------- Book details ----------

    private void showBookDetails(HttpServletRequest request, HttpServletResponse response, List<Book> allBooks)
            throws ServletException, IOException {

        Book found = null;
        Integer id = parseId(request.getParameter("id"));

        if (id != null) {
            for (Book book : allBooks) {
                if (book.getBookId() == id) {
                    found = book;
                    break;
                }
            }
        }

        if (found == null) {
            // the view shows a friendly "book not found" message when "book" is absent
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        } else {
            request.setAttribute("book", found);
        }
        request.getRequestDispatcher(BOOK_VIEW).forward(request, response);
    }

    private Integer parseId(String value) {
        if (value == null) {
            return null;
        }
        try {
            return Integer.parseInt(value.trim());
        } catch (NumberFormatException e) {
            return null;
        }
    }
}