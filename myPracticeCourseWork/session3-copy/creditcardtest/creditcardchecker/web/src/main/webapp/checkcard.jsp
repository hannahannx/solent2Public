<%-- 
    Document   : checkcard
    Created on : 28 Jul 2021, 17:13:43
    Author     : cgallen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="solent.ac.uk.ood.examples.cardcheck.CardValidationResult" %>
<%@ page import="solent.ac.uk.ood.examples.cardcheck.RegexCardValidator" %>

<%
    String creditcardno = request.getParameter("creditcardno");

    // TODO CREATE LOGIC TO CHECK A CARD HERE
    String cardNum = request.getParameter("cardNum");
    // TIP - LOOK AT THE CODE IN TestRegexCardValidator.java
    CardValidationResult result = RegexCardValidator.isValid(cardNum);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Check Credit Card</h1>
        
        <!-- this is the form that the user will be entering their card information in -->
        <form action="./checkcard.jsp" method="post">
            <input type="text" name="cardNum" value="<%=cardNum%>">
            <input type="hidden" name="action">
            <input type="submit" name="submit">
        </form>
        
            <!<!-- message to show if the card details are valid or not -->
            <% if (result.isValid()) {%>
            <br> " <%=result.getCardNo()%>" is a valid card number issued by <%=result.getCardType()%>
            <%
                }else{
            %>
            <br>"<%= result.getCardNo()%>" is an invalid card number. <br> <%=result.getError()%>
            <%
            }
            %>
    </body>
</html>
