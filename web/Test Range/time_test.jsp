<%-- 
    Document   : time_test
    Created on : 09.12.2016, 14:35:55
    Author     : MM-Produktion
--%>

<%@page import="Activity.activityGetter"%>
<%@page import="Hibernate.Activity"%>
<%@page import="Hibernate.HibernateUtil"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table class="table" width=”600px” border=”1″ bgcolor=”#FFF380″> 
            <tr>
                <th width=”100px”>ID</th>
                <th width=”100px”>Name</th>
                <th width=”100px”>Kategorie</th>
            </tr>
            <tr>                
                <%                Activity[] ActivityArr = activityGetter.getActivities();
                    for (int i = 0; i < ActivityArr.length; i++) {

                %> 
            <tr>
                <td><b><%=ActivityArr[i].getActivityId()%></b></td>
                <td><b><%=ActivityArr[i].getActivityName()%></b></td>
                <td><b><%=ActivityArr[i].getCategory().getCategoryName()%></b></td>



                <%
                    }
                    HibernateUtil.getSessionFactory().getCurrentSession().disconnect();

                %>               
            </tr>
        </table>
        <%
        %>


    </body>
</html>
