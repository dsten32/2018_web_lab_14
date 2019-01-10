<%--
  Created by IntelliJ IDEA.
  User: dwc1
  Date: 10/01/2019
  Time: 1:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Title</title>
    <style>
        table,thead,th,tr,td {
            border: black;
            border-width: thin;
        }
        th{
            height: 50px;
            background-color: pink;
            border: black;
            border-width: 1px;
            width: max-content;
            padding-left: 10px;
        }

        td.name{
            background-color: lavender;
            width: max-content;
            padding-left: 10px;
            border: black;
            border-width: 1px;
        }

        td.size{
            background-color: lightgray;
            width: max-content;
            padding-left: 10px;
            border: black;
            border-width: 1px;
        }
    </style>
</head>
<body>

<p> Photo path = ${photosPath}</p>
<table>
    <thead>
    <tr>
        <th>Thumbnail</th>
        <th><a href='ImageGalleryDisplay?sortColumn=filename&order=${filenameSortToggle}ending'>Filename <img src='images/sort-${filenameSortToggle}.png' alt='icon' /></a></th>
        <th><a href='ImageGalleryDisplay?sortColumn=filesize&order=${filesizeSortToggle}ending'>File-size <img src='images/sort-${filesizeSortToggle}.png'  alt='icon' /></a></th>
    </tr>
    </thead>
<core:forEach items="${fileDataList}" var="file">

    <tr>
        <td><a href="./Photos/${file.fileName}" ><img width="110px" src="./Photos/${file.thumbFileName}"></a></td>
        <td class="name">${file.thumbDisplay}</td>
        <td class="size">${file.fullfileSize} kb</td>
    </tr>
</core:forEach>
</table>

</body>
</html>
