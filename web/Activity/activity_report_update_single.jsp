<%-- 
    Document   : activity_report_update_single
    Created on : 10.12.2016, 17:37:03
    Author     : Ho0lsten 3570
--%>

<%@page import="Activity.activitySetter"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="Hibernate.HibernateUtil"%>
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
                ActivityReport actrep = activityGetter.getActivityReportById(Integer.parseInt(s0));
                String s1 = actrep.getActivityDescription();
                // out.println(s1);
                String s2 = actrep.getActivity().getActivityName();
                Date s3 = actrep.getActivityStartTime();
                Date s4 = actrep.getActivityEndTime();

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

            Aktivität: <select name="Kategorien">

                <%
                    Activity[] ActivityArr = activityGetter.getActivities();
                    for (int i = 0; i < ActivityArr.length; i++) {

                %> 

                <option value="<%=ActivityArr[i].getActivityId()%>" selected="<%=s2%>"><%=ActivityArr[i].getActivityName()%></option>        

                <%
                    }
                    HibernateUtil.getSessionFactory().getCurrentSession().disconnect();

                %>
            </select>
            Beschreibung: <input type="text" name="Beschreibung" value="<%=s1%>">
            Startzeit: <input type="datetime-local" name="Startzeit" value="<%=s3%>"><span class="badge"><%=s3%></span>
            Endzeit: <input type="datetime-local" name="Endzeit" value="<%=s4%>"><span class="badge"><%=s4%></span>

            <%}
                String u0 = request.getParameter("ID");
                String u1 = request.getParameter("Aktivität");
                String u2 = request.getParameter("Beschreibung");
                String u3 = request.getParameter("Startzeit");
                String u4 = request.getParameter("Startzeit");

                if (u0 != null && u1 != null && u2 != null && u3 != null && u4 != null) {

                    Activity activity = new Activity();
                    Integer activityid = Integer.parseInt(u1);
                    activity.setActivityId(activityid);

                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

                    LocalDateTime ast = LocalDateTime.parse(u3, formatter);
                    LocalDateTime aet = LocalDateTime.parse(u4, formatter);

                    Timestamp activity_start_time = Timestamp.valueOf(ast);
                    Timestamp activity_end_time = Timestamp.valueOf(aet);

                    long duration_seconds = activity_end_time.getTime() - activity_start_time.getTime();
                    int durtion_seconds_int = (((int) duration_seconds) / 1000);
                    if (durtion_seconds_int > 0) {
                        activitySetter.updateActivityReportById(Integer.parseInt(u0), activity, u2, activity_start_time, activity_end_time);
                        out.println("Die Aktivität " + u1 + " wurde erfolgreich geändert.");
                    } else {  %>
            <script> alert('Bitte kürzeren Zeitraum angeben (maxmimal 7 Tage)');</script>
            <%}
                    //out.println("Kategorie" + s2 + "angelegt");
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
