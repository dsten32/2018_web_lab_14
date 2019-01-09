<%--
  Created by IntelliJ IDEA.
  User: dwc1
  Date: 10/01/2019
  Time: 11:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<% LocalDateTime time=LocalDateTime.now(); %>
<% DateTimeFormatter formatTime=DateTimeFormatter.ofPattern("EEE hh:mm:ss a"); %>
<% out.print(String.format("%s",time.format(formatTime))); %>
</body>
</html>
