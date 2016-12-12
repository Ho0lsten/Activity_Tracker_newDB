<%-- 
    Document   : analysis
    Created on : 02.12.2016, 12:52:45
    Author     : hools_000
--%>

<%@page import="Hibernate.ActivityReport"%>
<%@page import="parser.durationCalc"%>
<%@page import="Activity.activityGetter"%>
<%@page import="Hibernate.Activity"%>
<%@page import="Hibernate.Activity"%>
<%@page import="Hibernate.HibernateUtil"%>
<%@page import="Category.categoryGetter"%>
<%@page import="Hibernate.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Activity Tracker - show analysis</title>

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
        <h1><a href="../index.jsp">Auswertung deiner Daten</a></h1>
        <p>queryn</p> 
    </div>
</div><!-- /End Jumbotron -->
<body>
<div id="foo" class="panel panel-default" >
    <!-- Default panel contents -->
    <div class="panel-heading">Kategorien</div>

    <!-- Table -->
    <table class="table" width=”600px” border=”1″ bgcolor=”#FFF380″> 
        <tr>
            <th width=”50px”>ID</th>
            <th width=”50px”>Name</th>
            <th width="400px">Beschreibung</th>
            <th width=”50px”>Typ</th>

        </tr>
        <tr>                
            <%
                Category[] CategoryArr = categoryGetter.getCategorys();
                for (int i = 0; i < CategoryArr.length; i++) {
            %> 
        <tr>
            <td><b><%=CategoryArr[i].getCategoryId()%></b></td>
             <td><b><a href="Statistics/../category_detail.jsp?ID=<%=CategoryArr[i].getCategoryId()%>"><%=CategoryArr[i].getCategoryName()%></a></b></td>
            <td><b><%=CategoryArr[i].getCategoryDescription()%></b></td>
            <td><b><%=CategoryArr[i].getCategoryType()%></b></td>


            <%
                }
                HibernateUtil.getSessionFactory().getCurrentSession().disconnect();

            %>               
        </tr>
    </table>
</div>
  
        
 <div id="foo" class="panel panel-default" >
    <!-- Default panel contents -->
    <div class="panel-heading">Kategorien</div>

    <!-- Table -->
    <table class="table" width=”600px” border=”1″ bgcolor=”#FFF380″> 
        <tr>
            <th width=”100px”>ID</th>
            <th width=”100px”>Name</th>
            <th width=”100px”>Beschreibung</th>
            <th width=”100px”>Kategorie</th>
            <th width=”100px”>Startdatum</th>
            <th width=”100px”>Enddatum</th>
            <th width=”100px”>Dauer</th>
        </tr>
        <tr>                
            <%   
                String s0 = "1";
                
                ActivityReport[] ActivityReportArr = activityGetter.getActivityReportsByCategoryId(Integer.parseInt(s0));
                for (int i = 0; i < ActivityReportArr.length; i++) {
                    Integer z = ActivityReportArr[i].getActivityReportId();
                    String duration = parser.duration.getActivityReportDurationById(z);

            %> 
        <tr>
            <td><b><%=ActivityReportArr[i].getActivityReportId()%></b></td>
            <td><b><%=ActivityReportArr[i].getActivity().getActivityName()%></b></td>
            <td><b><%=ActivityReportArr[i].getActivityDescription()%></b></td> 
            <td><b><%=ActivityReportArr[i].getActivity().getCategory().getCategoryName()%></b></td>
            <td><b><%=ActivityReportArr[i].getActivityStartTime()%></b></td>
            <td><b><%=ActivityReportArr[i].getActivityEndTime()%></b></td>  
            <td><b><%=duration%></b></td>                  



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
