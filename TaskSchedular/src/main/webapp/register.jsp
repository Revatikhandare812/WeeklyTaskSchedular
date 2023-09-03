<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register User</title>
<link rel="stylesheet" href="logreg.css">
</head>
<body class="registerbody">
     <div class="registration-container">
    <h1>Create an Account</h1>
    <form action="regform" method="post">
      <input type="text" name="name1" placeholder="Username" required> <br/><br/>
      <input type="email" name="email1" placeholder="Email" required> <br/><br/>
      <input type="password" name="pass1" placeholder="Password" required> <br/><br/>
      <div>
        <input type="radio" name="gender1" value="Male" required> Male
        <input type="radio" name="gender1" value="Female" required> Female
      </div><br/><br/>
      <input type="tel" name="phone" placeholder="Mobile Number" required> <br/><br/>
      <select name="city1">
        <option>Select City</option>
        <option>Delhi</option>
        <option>Mumbai</option>
        <option>Pune</option>
      </select><br/><br/>
      <input type="submit" value="Register"> <br/><br/>
    </form>
    <div class="signup-link">
      Already Registered? <a href="login.jsp">Login Here</a>
    </div>
  </div>
</body>
</html> 