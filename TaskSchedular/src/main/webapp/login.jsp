<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
<link rel="stylesheet" href="logreg.css">
</head>
<body class="loginbody">
 <div class="login-container">
    <h1>Welcome Back</h1>
    <form action="LoginServlet" method="post">
      <input type="text" name="uname" placeholder="Username">
      <input type="password" name="upwd" placeholder="Password">
      <div>
        <input type="submit" value="Login">
        <input type="reset">
      </div>
    </form>
    <div class="signup-link">
      Don't have an account? <a href="register.jsp">Sign Up</a>
    </div>
  </div>
</body>
</html>