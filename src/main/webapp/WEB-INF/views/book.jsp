<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LIBIS - Book Details</title>
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
        .details-card { background: white; border-radius: 15px; padding: 35px; border-left: 5px solid #0d6efd; max-width: 820px; margin: 0 auto; }
        .details-card h3 { color: #0a1628; font-weight: 700; margin-bottom: 4px; }
        .details-card .author { color: #6c757d; font-size: 17px; margin-bottom: 18px; }
        .meta-row { display: flex; flex-wrap: wrap; gap: 12px; align-items: center; margin-bottom: 25px; }
        .genre-tag { background: #f0f4ff; color: #0d6efd; padding: 5px 14px; border-radius: 20px; font-weight: 600; font-size: 13px; }
        .badge-available { background: #d4edda; color: #155724; padding: 5px 12px; border-radius: 20px; font-weight: 600; font-size: 13px; }
        .badge-unavailable { background: #f8d7da; color: #721c24; padding: 5px 12px; border-radius: 20px; font-weight: 600; font-size: 13px; }
        .synopsis-title { color: #0a1628; font-weight: 700; font-size: 16px; margin-bottom: 8px; }
        .synopsis-text { color: #343a40; font-size: 16px; line-height: 1.7; max-width: 70ch; }
        .btn-back { background: #0a1628; color: white; border-radius: 8px; padding: 8px 20px; }
        .btn-back:hover { background: #1a3a5c; color: white; }
        .not-found { text-align: center; padding: 30px 0; }
        .not-found i { font-size: 44px; color: #adb5bd; margin-bottom: 15px; }
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

    <div class="container mt-4 mb-5">
        <div class="details-card">
            <c:choose>
                <c:when test="${not empty book}">
                    <h3><c:out value="${book.title}"/></h3>
                    <p class="author">by <c:out value="${book.author}"/></p>

                    <div class="meta-row">
                        <span class="genre-tag"><i class="fas fa-tag me-1"></i> <c:out value="${book.genre}"/></span>
                        <c:choose>
                            <c:when test="${book.available}">
                                <span class="badge-available"><i class="fas fa-check-circle"></i> Available</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge-unavailable"><i class="fas fa-times-circle"></i> Borrowed</span>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <p class="synopsis-title">Synopsis</p>
                    <p class="synopsis-text"><c:out value="${book.synopsis}"/></p>
                </c:when>
                <c:otherwise>
                    <div class="not-found">
                        <i class="fas fa-book"></i>
                        <h4>Book not found</h4>
                        <p class="text-muted">We couldn't find a book with that ID. Go back to the catalogue and pick one from the list.</p>
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="mt-4">
                <a href="${pageContext.request.contextPath}/catalogue" class="btn btn-back">
                    <i class="fas fa-arrow-left me-1"></i> Back to catalogue
                </a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
