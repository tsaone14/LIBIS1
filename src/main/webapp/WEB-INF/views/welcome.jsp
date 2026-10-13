<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LIBIS - Book Catalogue</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body { background: #f4f7fc; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .navbar-custom { background: linear-gradient(135deg, #0a1628 0%, #1a3a5c 100%); padding: 15px 0; }
        .navbar-custom .navbar-brand { color: white; font-weight: 700; font-size: 24px; }
        .navbar-custom .navbar-brand i { color: #4d9eff; margin-right: 10px; }
        .navbar-custom .welcome-text { color: white; font-size: 16px; }
        .navbar-custom .welcome-text strong { color: #4d9eff; }
        .navbar-custom .btn-logout { background: rgba(255,255,255,0.1); border: 1px solid rgba(255,255,255,0.2); color: white; border-radius: 8px; padding: 6px 18px; }
        .page-header { background: white; border-radius: 15px; padding: 25px 30px; margin-bottom: 30px; border-left: 5px solid #0d6efd; }
        .page-header h4 { color: #0a1628; font-weight: 700; margin: 0; }
        .page-header .book-count { color: #6c757d; font-size: 14px; margin: 5px 0 0 0; }
        .book-table-container { background: white; border-radius: 15px; padding: 20px; }
        .badge-available { background: #d4edda; color: #155724; padding: 5px 12px; border-radius: 20px; font-weight: 600; font-size: 12px; }
        .badge-unavailable { background: #f8d7da; color: #721c24; padding: 5px 12px; border-radius: 20px; font-weight: 600; font-size: 12px; }
        .view-link { color: white; background: #0d6efd; text-decoration: none; margin-right: 6px; padding: 4px 10px; border: 1px solid #0d6efd; border-radius: 4px; font-size: 12px; display: inline-block; }
        .view-link:hover { background: #0b5ed7; color: white; }
        .dummy-link { color: #4a90e2; text-decoration: none; margin-right: 6px; padding: 4px 10px; border: 1px solid #4a90e2; border-radius: 4px; font-size: 12px; display: inline-block; }
        .dummy-link:hover { background-color: #4a90e2; color: white; }
        .btn-search { background: #0a1628; color: white; }
        .btn-search:hover { background: #1a3a5c; color: white; }
    </style>
</head>
<body>

    <nav class="navbar navbar-custom">
        <div class="container">
            <span class="navbar-brand"><i class="fas fa-book-open"></i> LIBIS</span>
            <div class="d-flex align-items-center gap-3">
                <span class="welcome-text">
                    <i class="fas fa-user-circle me-1"></i>
                    Welcome, <strong><c:out value="${member.firstName}"/> <c:out value="${member.lastName}"/></strong>
                </span>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-logout">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="page-header">
            <h4><i class="fas fa-list"></i> Book Catalogue</h4>
            <p class="book-count">
                <i class="fas fa-book me-1"></i>
                <c:choose>
                    <c:when test="${empty searchTerm}">
                        Showing all <strong>${books.size()}</strong> books in the LIBIS collection
                    </c:when>
                    <c:otherwise>
                        <strong>${books.size()}</strong> result(s) for "<c:out value="${searchTerm}"/>"
                    </c:otherwise>
                </c:choose>
            </p>
        </div>

        <form class="row g-2 mb-4" method="get" action="${pageContext.request.contextPath}/catalogue">
            <div class="col-md-6 col-lg-4">
                <input type="text" name="q" class="form-control" placeholder="Search by title"
                       value="<c:out value='${searchTerm}'/>">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-search"><i class="fas fa-search"></i> Search</button>
                <c:if test="${not empty searchTerm}">
                    <a href="${pageContext.request.contextPath}/catalogue" class="btn btn-outline-secondary">Clear</a>
                </c:if>
            </div>
        </form>

        <div class="book-table-container">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Genre</th>
                            <th>Availability</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="book" items="${books}">
                            <tr>
                                <td><strong><c:out value="${book.title}"/></strong></td>
                                <td><c:out value="${book.author}"/></td>
                                <td><c:out value="${book.genre}"/></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${book.available}">
                                            <span class="badge-available"><i class="fas fa-check-circle"></i> Available</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge-unavailable"><i class="fas fa-times-circle"></i> Borrowed</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/book?id=${book.bookId}" class="view-link">View</a>
                                    <a href="#" class="dummy-link">Borrow</a>
                                    <a href="#" class="dummy-link">Reserve</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty books}">
                            <tr>
                                <td colspan="5" class="text-center text-muted py-4">
                                    No books match "<c:out value="${searchTerm}"/>".
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>