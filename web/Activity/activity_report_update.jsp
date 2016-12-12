<%-- 
    Document   : activity_report_update
    Created on : 10.12.2016, 17:36:42
    Author     : Ho0lsten 3570
--%>

<%@page import="Hibernate.ActivityReport"%>
<%@page import="Hibernate.HibernateUtil"%>
<%@page import="Activity.activityGetter"%>
<%@page import="Hibernate.Activity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Activity Tracker - update entrys</title>

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
        <p>Zeiten falsch aufgenommen? Hier können Sie diese verändern.</p> 
    </div>
</div><!-- /End Jumbotron -->

<body>

        
         <div id="foo" class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">Kategorien</div>

    <!-- Table -->
    <table class="table" width=”600px” border=”1″ bgcolor=”#FFF380″> 
        <tr>
            <th width=”100px”></th>
            <th width="100px">Aktivität</th>
            <th width=”100px”>Beschreibung</th>
            <th width=”100px”>Kategorie</th>
            <th width=”100px”>Startzeit</th>
            <th width=”100px”>Endzeit</th>

        </tr>
        <tr>                
            <%  ActivityReport[] ActivityReportArr = activityGetter.getActivityReports();
                //Activity[] ActivityArr = activityGetter.getActivities();
                for (int i = 0; i < ActivityReportArr.length; i++) {
            %> 
        <tr>
             <td><b><a class="btn btn-default"href="activity_report_update_single.jsp?ID=<%=ActivityReportArr[i].getActivityReportId()%>">korrigieren</a></b></td>
            <td><b><%=ActivityReportArr[i].getActivity().getActivityName()%></b></td>
            <td><b><%=ActivityReportArr[i].getActivityDescription()%></b></td> 
            <td><b><%=ActivityReportArr[i].getActivity().getCategory().getCategoryName()%></b></td>
            <td><b><%=ActivityReportArr[i].getActivityStartTime()%></b></td>
            <td><b><%=ActivityReportArr[i].getActivityEndTime()%></b></td>
            


            <%
                }
                HibernateUtil.getSessionFactory().getCurrentSession().disconnect();

            %>               
        </tr>
    </table>
</div>
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
