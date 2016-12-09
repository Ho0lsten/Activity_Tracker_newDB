<%-- 
    Document   : activity_get_id
    Created on : 08.12.2016, 17:06:20
    Author     : MM-Produktion
--%>

<%@page import="Hibernate.HibernateUtil"%>
<%@page import="Hibernate.Activity"%>
<%@page import="Activity.activityGetter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="single_category_overview.jsp">
            <input type="text" name="ID">
            <input type="submit" value="einlesen">

            <% // String s0 = request.getParameter("ID");
                //  if (s0 != null) {
                //     Category cat = categoryGetter.getCategoryById(Integer.parseInt(s0));
                //   String s1 = cat.getCategoryName();
                // out.println(s1);
                //   String s2 = cat.getCategoryDescription();
                // out.println(s2);
                //   String s3 = cat.getCategoryType();
                // out.println(s3);
                // Array s4[] = cat.getActivities();            

                // request.setAttribute("Type", s3);
                // request.setAttribute("Activities", s3);
                //}
            %> 

        </form>

        <table class="table" width=”600px” border=”1″ bgcolor=”#FFF380″> 
            <tr>
                <th width=”100px”>ID</th>
                <th width=”100px”>Name</th>
                <th width=”100px”>Beschreibung</th>
                <th width=”100px”>Kategorie</th>
                <th width=”100px”>Startzeit</th>
                <th width=”100px”>Endzeit</th>

            </tr>
            <tr>                
                <%            Activity[] ActivityArr = activityGetter.getActivities();
                    for (int i = 0; i < ActivityArr.length; i++) {

                %> 
            <tr>
                <td><b><%=ActivityArr[i].getActivityId()%></b></td>
                <td><b><a href="single_activity_overview.jsp?ID=<%=ActivityArr[i].getActivityId()%>"><%=ActivityArr[i].getActivityName()%></a></b></td>
                <td><b><%=ActivityArr[i].getActivityDescription()%></b></td> 
                <td><b><%=ActivityArr[i].getCategory().getCategoryId()%></b></td>
                <td><b><%=ActivityArr[i].getActivityStartTime()%></b></td>
                <td><b><%=ActivityArr[i].getActivityEndTime()%></b></td> 


                <%
                    }
                    HibernateUtil.getSessionFactory().getCurrentSession().disconnect();

                %>               
            </tr>
        </table>
</html>
