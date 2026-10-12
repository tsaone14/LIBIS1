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

@WebServlet(name = "catalogueController", value = "/catalogue")
public class CatalogueController extends HttpServlet {

    @Override
    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Book> allBooks = (List<Book>) session.getAttribute(loginController.SESSION_BOOKS);

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

        request.setAttribute("member", session.getAttribute(loginController.SESSION_MEMBER));
        request.setAttribute("books", results);
        request.setAttribute("searchTerm", term);
        request.getRequestDispatcher("/WEB-INF/views/welcome.jsp").forward(request, response);
    }
}
