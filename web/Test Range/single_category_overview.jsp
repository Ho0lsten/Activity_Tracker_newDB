<%-- 
    Document   : single_category_overview
    Created on : 08.12.2016, 10:25:38
    Author     : MM-Produktion
--%>

<%@page import="Category.categorySetter"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Hibernate.HibernateUtil"%>
<%@page import="Category.categoryGetter"%>
<%@page import="java.sql.Array"%>
<%@page import="Hibernate.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Activity Tracker - create activity</title>

    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="../css/font-awesome.min.css">

    <!-- Custom Style -->
    <link rel="stylesheet" href="../css/style.css">

    <!-- Combodate.js -->
    <link rel="javascript" href="../css/combodate.js">


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
    <body>

        <form>
            <%  String s0 = request.getParameter("ID");
                if (s0 != null) {
                    Category cat = categoryGetter.getCategoryById(Integer.parseInt(s0));
                    String s1 = cat.getCategoryName();
                    // out.println(s1);
                    String s2 = cat.getCategoryDescription();
                    // out.println(s2);
                    String s3 = cat.getCategoryType();
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
            Typ: <input type="text" name="Type" value="<%=s3%>">
            Aktivitäten: <input type="text" name="Activities" value="<%//=s4%>">
            <input type="submit" name="Update!">

            <%}
                String u0 = request.getParameter("ID");
                String u1 = request.getParameter("Name");
                String u2 = request.getParameter("Description");
                String u3 = request.getParameter("Type");

                if (u0 != null && u1 != null && u2 != null && u3 != null) {
                    categorySetter.updateCategoryById(Integer.parseInt(u0), u1, u2, u3);
                    out.println("Die Kategorie " + u1 + " wurde erfolgreich geändert.");
                }


            %>
        </form>
    </body>
</html>
