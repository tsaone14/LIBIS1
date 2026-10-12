package com.example.libis1;

import java.io.*;
import java.util.ArrayList;

import com.example.libis1.model.Member;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;
    ArrayList<Member> users = new ArrayList<Member>();

    public void init() {
        Member Tsaone = new Member("Tsaone", "Makoba", "tsaone@gmail.com", "12345");
        Member Boago = new Member("Boago", "Nkhii", "boago@gmail.com", "123456");
        Member Kopo = new Member ("Kopo", "Mokote", "kopo@gmail.com", "1234567");
        users.add(Tsaone);
        users.add(Boago);
        users.add(Kopo);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}