package com.example.libis1.controller;

import com.example.libis1.model.Book;
import com.example.libis1.model.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "loginController", value = "/login")
public class loginController extends HttpServlet {

    public static final String SESSION_MEMBER = "loggedInMember";
    public static final String SESSION_BOOKS = "books";

    private ArrayList<Member> members = new ArrayList<>();
    private ArrayList<Book> books = new ArrayList<>();

    @Override
    public void init() {

        Member tsaone = new Member(101, "Tsaone", "Makoba", "tsaonem@gmail.com", "tm12345");
        Member abotle = new Member(102, "Abotle", "Moabi", "abotlem@gmail.com", "am123456");
        Member kopo = new Member(103, "Kopo", "Mokote", "kopom@gmail.com", "km12445678");
        Member opang = new Member(104, "Opang", "Reakae", "opangr@gmail.com", "or123456789");
        Member katlego = new Member(105, "Katlego", "Baitirile", "katlegob@gmail.com", "kn12345678910");

        members.add(tsaone);
        members.add(abotle);
        members.add(kopo);
        members.add(opang);
        members.add(katlego);

        Book theGreatGatsby = new Book(1, "The Great Gatsby", "F. Scott Fitzgerald", "Classic Fiction",
                "A story of the mysteriously wealthy Jay Gatsby and his love for the beautiful Daisy Buchanan.", true);
        Book toKillAMockingbird = new Book(2, "To Kill a Mockingbird", "Harper Lee", "Southern Gothic",
                "The story of racial injustice and the loss of innocence in a small Alabama town.", false);
        Book thisIsMyHouse = new Book(3, "This is My House", "Sienna Spiro", "RomCom",
                "Setting boundaries in an unfulfilling relationship.", true);
        Book favoriteMistake = new Book(4, "Favorite Mistake", "Giveon", "RomCom",
                "A story of a troubled man cheating on his girlfriend.", true);
        Book chihiro = new Book(5, "Chihiro", "Billie Eilish", "Fantasy",
                "The story of a girl seeing her dead friend in everything she looks at.", false);
        Book demonSlayer = new Book(6, "Demon Slayer", "Koyoharu Gotouge", "Sci-fi",
                "A boy's sister got turned into a demon and he's trying to make her human again.", true);
        Book damsel = new Book(7, "Damsel", "Millie Bobby Brown", "Dark Fiction",
                "A girl marries a prince only to find out he's trying to feed her to a dragon.", true);
        Book geoStorm = new Book(8, "GeoStorm", "Cathy", "Nature Horror",
                "The story of a storm that kills over a billion people.", true);
        Book goodBadAndUgly = new Book(9, "Good, Bad and Ugly", "Giveon", "RomCom",
                "A man loving his wife through cancer and infertility.", false);
        Book less = new Book(10, "Less", "Olivia Rodrigo", "Sad Romance",
                "A story of a girl begging a man to love her less if it means staying forever.", true);

        books.add(theGreatGatsby);
        books.add(toKillAMockingbird);
        books.add(thisIsMyHouse);
        books.add(favoriteMistake);
        books.add(chihiro);
        books.add(demonSlayer);
        books.add(damsel);
        books.add(geoStorm);
        books.add(goodBadAndUgly);
        books.add(less);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute(SESSION_MEMBER) != null) {
            response.sendRedirect(request.getContextPath() + "/catalogue");
            return;
        }
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Member foundMember = null;
        if (email != null && password != null && !email.isBlank() && !password.isBlank()) {
            for (Member member : members) {
                if (email.equalsIgnoreCase(member.getEmail()) && password.equals(member.getPassword())) {
                    foundMember = member;
                    break;
                }
            }
        }

        if (foundMember != null) {
            HttpSession session = request.getSession(true);
            request.changeSessionId();
            session.setAttribute(SESSION_MEMBER, foundMember);
            session.setAttribute(SESSION_BOOKS, books);
            response.sendRedirect(request.getContextPath() + "/catalogue");
        } else {
            request.setAttribute("loginError", "Invalid email or password. Please try again.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}