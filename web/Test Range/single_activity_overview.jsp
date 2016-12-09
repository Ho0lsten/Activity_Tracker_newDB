<%-- 
    Document   : single_activity_overview
    Created on : 08.12.2016, 17:06:33
    Author     : MM-Produktion
--%>

<%@page import="Activity.activitySetter"%>
<%@page import="Hibernate.Category"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="Activity.activityGetter"%>
<%@page import="Hibernate.Activity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            <%  String s0 = request.getParameter("ID");
                if (s0 != null) {
                    Activity act = activityGetter.getActivityById(Integer.parseInt(s0));
                    String s1 = act.getActivityName();
                    String s2 = act.getActivityDescription(); 
                    Category s3 = act.getCategory();
                    Timestamp s4 = act.getActivityStartTime();
                    Timestamp s5 = act.getActivityEndTime();

                    // out.println(s3);
                    // Array s4[] = cat.getActivities();            
                    // request.setAttribute("Type", s3);
                    // request.setAttribute("Activities", s3);

            %> 
        </form>
        <form action="single_category_overview.jsp">
            <input type="submit" name="Update!">
            <input type="hidden" name="ID" value="<%=s0%>">
            Name: <input type="text" name="Name" value="<%=s1%>">
            Beschreibung: <input type="text" name="Description" value="<%=s2%>">
            Category <select name="Type" value="<%=s3.getCategoryName()%>">
            Startzeit <input type="datetime-local" name="Activities" value="<%=s4%>">
            Endzeit <input type="datetime-local" name="Activities" value="<%=s5%>">
            <input type="submit" name="Update!">

            <%}
              //  String u0 = request.getParameter("ID");
              //  String u1 = request.getParameter("Name");
              //  String u2 = request.getParameter("Description");
               // String u3 = request.getParameter("Type");

              //  if (u0 != null && u1 != null && u2 != null && u3 != null) {
               //     activitySetter.updateActivityById(Integer.parseInt(u0), u1, u2, u3);
               //     out.println("Die Kategorie " + u1 + " wurde erfolgreich geändert.");
              //  }


            %>
        </form>
    </body>
</html>
