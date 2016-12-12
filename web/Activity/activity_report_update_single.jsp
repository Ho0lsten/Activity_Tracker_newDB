<%-- 
    Document   : activity_report_update_single
    Created on : 10.12.2016, 17:37:03
    Author     : Ho0lsten 3570
--%>

<%@page import="Hibernate.Activity"%>
<%@page import="Activity.activityGetter"%>
<%@page import="Hibernate.ActivityReport"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Activity Tracker - update entry</title>

    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="../css/font-awesome.min.css">

    <!-- Custom Style -->
    <link rel="stylesheet" href="../css/style.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>



<!-- Jumbotron -->
<div class="jumbotron">
    <div class="container">
        <h1><a href="../index.jsp">Zeiten korrigieren.</a></h1>
        <p></p> 
    </div>
</div><!-- /End Jumbotron -->

<body>


    <%  String s0 = request.getParameter("ID");

        if (s0 != null) {
            Activity act = activityGetter.getActivityById(Integer.parseInt(s0));
            String s1 = act.getActivityName();
            // out.println(s1);
            String s2 = act.getCategory().getCategoryName();
            //  String s4 = Integer.toString(s3);

            // out.println(s2);
            // out.println(s3);
            // Array s4[] = cat.getActivities();            
            // request.setAttribute("Type", s3);
            // request.setAttribute("Activities", s3);

    %> 

    <form action="activity_update_single.jsp">
        <input type="submit" name="Update!" value="ändern">
        <input type="hidden" name="ID" value="<%=s0%>">
        Name: <input type="text" name="Name" value="<%=s1%>">
        Kategorie: <select name="Kategorien">

            <%
                Category[] CategoryArr = categoryGetter.getCategorys();
                for (int i = 0; i < CategoryArr.length; i++) {

            %> 

            <option value="<%=CategoryArr[i].getCategoryId()%>" selected="<%=s2%>"><%=CategoryArr[i].getCategoryName()%></option>        

            <%
                }
                HibernateUtil.getSessionFactory().getCurrentSession().disconnect();

            %>
        </select>

        <%}
            String u0 = request.getParameter("ID");
            String u1 = request.getParameter("Name");
            String u2 = request.getParameter("Kategorien");

            if (u0 != null && u1 != null && u2 != null) {
                Category category = new Category();
                Integer categoryid = Integer.parseInt(u2);
                category.setCategoryId(categoryid);
                activitySetter.updateActivityById(Integer.parseInt(u0), u1, category);
                out.println("Die Aktivität " + u1 + " wurde erfolgreich geändert.");
            }


        %>
    </form>
</body>

<hr>

<footer>
    <p>&copy; 2016 MoveoMed, GmbH</p>
</footer>
</div> <!-- /container -->  



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</html>
