<%-- 
    Document   : time_test_2
    Created on : 10.12.2016, 14:08:02
    Author     : Gregor
--%>

<%@page import="Hibernate.HibernateUtil"%>
<%@page import="parser.timestamp"%>
<%@page import="Activity.activityGetter"%>
<%@page import="Hibernate.ActivityReport"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%

            String test = parser.duration.getActivityReportDurationById(10);
            out.println(test);


        %>


        <div id="foo" class="panel panel-default">
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
                    <%  ActivityReport[] ActivityReportArr = activityGetter.getActivityReports();
                        for (int i = 0; i < ActivityReportArr.length; i++) {
                            Integer z = ActivityReportArr[i].getActivity().getActivityId();
                            String duration = parser.duration.getActivityReportDurationById(z);
                    %> 
                <tr>
                    <td><b><%=ActivityReportArr[i].getActivity().getActivityId()%></b></td>
                    <td><b><%=ActivityReportArr[i].getActivity().getActivityName()%></b></td>
                    <td><b><%=ActivityReportArr[i].getActivityDescription()%></b></td> 
                    <td><b><%=ActivityReportArr[i].getActivity().getCategory().getCategoryId()%></b></td>
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
</html>
