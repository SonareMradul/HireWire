<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Help Page</title>
    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<h1>Welcome to JSP Help Page</h1>

<%= "Current Time: " + new java.util.Date() %>

</body>
</html>