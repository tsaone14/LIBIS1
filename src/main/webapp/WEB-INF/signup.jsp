<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LIBIS - Create Account</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #0a1628 0%, #1a3a5c 50%, #0d6efd 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px 0;
        }
        .login-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
            padding: 40px;
            max-width: 480px;
            width: 100%;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .login-card .logo { text-align: center; margin-bottom: 30px; }
        .login-card .logo i {
            font-size: 48px;
            color: #0d6efd;
            background: #f0f4ff;
            padding: 20px;
            border-radius: 50%;
        }
        .login-card h2 { color: #0a1628; font-weight: 700; text-align: center; margin-bottom: 8px; }
        .login-card .subtitle { color: #6c757d; text-align: center; font-size: 14px; margin-bottom: 25px; }
        .login-card .form-label { color: #0a1628; font-weight: 600; font-size: 14px; }
        .login-card .form-control {
            border-radius: 10px;
            border: 2px solid #e0e5ec;
            padding: 12px 16px;
            transition: all 0.3s ease;
        }
        .login-card .form-control:focus {
            border-color: #0d6efd;
            box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.2);
        }
        .login-card .form-text { font-size: 12px; }
        .login-card .btn-login {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            background: #0d6efd;
            border: none;
            font-weight: 600;
            font-size: 16px;
            color: white;
            transition: all 0.3s ease;
        }
        .login-card .btn-login:hover {
            background: #0b5ed7;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(13, 110, 253, 0.3);
        }
        .login-card .btn-login i { margin-right: 8px; }
        .login-card .error-message {
            background: #f8d7da;
            color: #842029;
            border-radius: 10px;
            padding: 10px 15px;
            font-size: 14px;
            margin-bottom: 20px;
            border-left: 4px solid #dc3545;
        }
        .login-card .error-message ul { margin: 0; padding-left: 18px; }
        .login-card .footer-text { text-align: center; color: #6c757d; font-size: 14px; margin-top: 20px; }
        .login-card .footer-text a { color: #0d6efd; font-weight: 600; text-decoration: none; }
        .login-card .footer-text a:hover { text-decoration: underline; }
        @media (max-width: 480px) {
            .login-card { padding: 25px 20px; margin: 15px; }
        }
    </style>
</head>
<body>
    <div class="login-card">
        <div class="logo">
            <i class="fas fa-user-plus"></i>
        </div>
        <h2>Create your account</h2>
        <p class="subtitle">Join LIBIS to browse the catalogue</p>

        <c:if test="${not empty signupErrors}">
            <div class="error-message" role="alert">
                <ul>
                    <c:forEach var="error" items="${signupErrors}">
                        <li><c:out value="${error}"/></li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/signup" method="post">
            <div class="row">
                <div class="col-sm-6 mb-3">
                    <label for="firstName" class="form-label">
                        <i class="fas fa-user me-1"></i> First name
                    </label>
                    <input type="text" class="form-control" id="firstName" name="firstName"
                           placeholder="First name" required autofocus
                           value="<c:out value='${firstName}'/>">
                </div>
                <div class="col-sm-6 mb-3">
                    <label for="lastName" class="form-label">
                        <i class="fas fa-user me-1"></i> Last name
                    </label>
                    <input type="text" class="form-control" id="lastName" name="lastName"
                           placeholder="Last name" required
                           value="<c:out value='${lastName}'/>">
                </div>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">
                    <i class="fas fa-envelope me-1"></i> Email Address
                </label>
                <input type="email" class="form-control" id="email" name="email"
                       placeholder="Enter your email" required
                       value="<c:out value='${email}'/>">
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">
                    <i class="fas fa-lock me-1"></i> Password
                </label>
                <input type="password" class="form-control" id="password" name="password"
                       placeholder="Create a password" minlength="8" required>
                <div class="form-text">At least 8 characters.</div>
            </div>

            <div class="mb-4">
                <label for="confirmPassword" class="form-label">
                    <i class="fas fa-lock me-1"></i> Confirm password
                </label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword"
                       placeholder="Re-enter your password" minlength="8" required>
            </div>

            <button type="submit" class="btn-login">
                <i class="fas fa-user-plus"></i> Create account
            </button>
        </form>

        <div class="footer-text">
            Already have an account?
            <a href="${pageContext.request.contextPath}/login">Sign in</a>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
