<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LIBIS - Login</title>
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
        }
        .login-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
            padding: 40px;
            max-width: 420px;
            width: 100%;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .login-card .logo {
            text-align: center;
            margin-bottom: 30px;
        }
        .login-card .logo i {
            font-size: 48px;
            color: #0d6efd;
            background: #f0f4ff;
            padding: 20px;
            border-radius: 50%;
        }
        .login-card h2 {
            color: #0a1628;
            font-weight: 700;
            text-align: center;
            margin-bottom: 8px;
        }
        .login-card .subtitle {
            color: #6c757d;
            text-align: center;
            font-size: 14px;
            margin-bottom: 25px;
        }
        .login-card .form-label {
            color: #0a1628;
            font-weight: 600;
            font-size: 14px;
        }
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
        .login-card .btn-login i {
            margin-right: 8px;
        }
        .login-card .divider {
            display: flex;
            align-items: center;
            color: #6c757d;
            font-size: 13px;
            margin: 20px 0;
        }
        .login-card .divider::before,
        .login-card .divider::after {
            content: "";
            flex: 1;
            border-top: 1px solid #e0e5ec;
        }
        .login-card .divider span {
            padding: 0 12px;
        }
        .login-card .btn-signup {
            display: block;
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            background: white;
            border: 2px solid #0d6efd;
            font-weight: 600;
            font-size: 16px;
            color: #0d6efd;
            text-align: center;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        .login-card .btn-signup:hover {
            background: #0d6efd;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(13, 110, 253, 0.3);
        }
        .login-card .btn-signup i {
            margin-right: 8px;
        }
        .login-card .error-message {
            background: #f8d7da;
            color: #842029;
            border-radius: 10px;
            padding: 10px 15px;
            font-size: 14px;
            margin-bottom: 20px;
            border-left: 4px solid #dc3545;
        }
        .login-card .error-message i {
            margin-right: 8px;
        }
        .login-card .success-message {
            background: #d1e7dd;
            color: #0f5132;
            border-radius: 10px;
            padding: 10px 15px;
            font-size: 14px;
            margin-bottom: 20px;
            border-left: 4px solid #198754;
        }
        .login-card .success-message i {
            margin-right: 8px;
        }
        .login-card .footer-text {
            text-align: center;
            color: #6c757d;
            font-size: 13px;
            margin-top: 20px;
        }
        @media (max-width: 480px) {
            .login-card {
                padding: 25px 20px;
                margin: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="login-card">
        <div class="logo">
            <i class="fas fa-book-open"></i>
        </div>
        <h2>LIBIS</h2>
        <p class="subtitle">Library Information System</p>

        <c:if test="${param.registered == 'true'}">
            <div class="success-message">
                <i class="fas fa-check-circle"></i>
                Account created. Sign in to continue.
            </div>
        </c:if>

        <c:if test="${not empty loginError}">
            <div class="error-message">
                <i class="fas fa-exclamation-circle"></i>
                <c:out value="${loginError}"/>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">
                    <i class="fas fa-envelope me-1"></i> Email Address
                </label>
                <input type="email" class="form-control" id="email" name="email"
                       placeholder="Enter your email" required autofocus
                       value="<c:out value='${param.email}'/>">
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">
                    <i class="fas fa-lock me-1"></i> Password
                </label>
                <input type="password" class="form-control" id="password" name="password"
                       placeholder="Enter your password" required>
            </div>

            <button type="submit" class="btn-login">
                <i class="fas fa-sign-in-alt"></i> Sign In
            </button>
        </form>

        <div class="divider"><span>New to LIBIS?</span></div>

        <a href="${pageContext.request.contextPath}/signup" class="btn-signup">
            <i class="fas fa-user-plus"></i> Sign Up
        </a>

        <div class="footer-text">
            <i class="fas fa-shield-alt me-1"></i> Secure Login
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
