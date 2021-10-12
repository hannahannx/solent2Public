<%-- 
    Document   : jspexample3
    Created on : 22-Jul-2021, 11:16:28
    Author     : admin
    THIS EXAMPLE SHOWS HOW OBJECTS CAN BE STORED IN THE SESSION
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    // retrieve the stored users list from the session
    List<String> users = (List<String>) session.getAttribute("users");
    if (users == null) {
        users = new ArrayList<String>();
        session.setAttribute("users", users);
    }

    String name = request.getParameter("userName");

    // find what action to perform on the page
    String action = request.getParameter("action");

    if ("removeUser".equals(action)) {
        users.remove(name);
    } else if ("addUser".equals(action)) {
        users.add(name);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Example 3</title>
    </head>
    <body>
        <h1>JSP Example 3: User list</h1>

        <h2>List of users</h2>
        
        
        <table>
            <tr>
                <th>
                    Name:
                </th>
                <th></th>
            </tr>
            <% for (String user : users) {%>
            <tr>
                <td><p><%=user%></p></td>
                <td>
                    <form action="./jspexample3.jsp" method="get">
                        <input type="hidden" name="userName" value="<%=user%>">
                        <input type="hidden" name="action" value="removeUser">
                        <button type="submit" >remove name from list</button>
                    </form> 
                </t>
            </tr>
            
                <%
                    }
                %>  
        </table>
        
        <h2>commands</h2>
        <form action="./jspexample3.jsp" method="get">
            <p>user name <input type="text" name="userName" value=""></p>
            <input type="hidden" name="action" value="addUser">
            <button type="submit" >add name to list</button>
        </form> 
        <br>
        
    </body>
</html>