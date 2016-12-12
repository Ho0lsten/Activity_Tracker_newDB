<%-- 
    Document   : category_detail
    Created on : 11.12.2016, 19:05:16
    Author     : Ho0lsten 3570
--%>

<%@page import="Hibernate.HibernateUtil"%>
<%@page import="Activity.activityGetter"%>
<%@page import="Hibernate.Activity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Activity Tracker - update activity</title>

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
        <h1><a href="../index.jsp">Aktivität bearbeiten.</a></h1>
        <p>Datensätze können nur einzeln bearbeitet werden.</p> 
    </div>
</div><!-- /End Jumbotron -->

<body>


    <%  String s0 = request.getParameter("ID");

        

    %> 
    
<form action="category_detail.jsp">
   
       
        <input type="hidden" name="ID" value="<%=s0%>">
        <div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">Aktivitäten</div>
    <!-- Table -->
    <table class="table" width=”600px” border=”1″ bgcolor=”#FFF380″> 
        <tr>
            <th width=”100px”>ID</th>
            <th width=”100px”>Name</th>
            <th width=”100px”>Kategorie</th>
        </tr>
        <tr>                
            <%                Activity[] ActivityArr = activityGetter.getActivitiesByCategoryId(Integer.parseInt(s0));
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
</div>
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
