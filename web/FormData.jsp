<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: dwc1
  Date: 10/01/2019
  Time: 11:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>getting form data and doing something with it</title>
</head>

<body>
<h1>Here's the jsp page with your form info</h1>

<p>Form data output below</p>

<% Map<String, String[]> map =request.getParameterMap(); %>
<% Iterator<Map.Entry<String, String[]>> i = map.entrySet().iterator(); %>
<table style="border-collapse: collapse">
<% while (i.hasNext()){
    Map.Entry<String, String[]> entry = i.next();
    String key = entry.getKey(); //.toUpperCase();
    String[] values = entry.getValue();

    if(key.contains("submit") || key.contains("button")) {
        continue;
    }

    int index = key.indexOf("[]");
    if(index != -1) {
        key = key.substring(0, index);
    }%>


<tr><td style='border: 1px solid black; padding:10px'><%=key%>:</td>



    <%for(String value: values) {%>
<td style='border: 1px solid black; padding:10px'><%= value %></td></tr>
    <%}
}
%>



</table>

</body>
</html>
