<%-- 
    Document   : calculate_category_durations
    Created on : 10.12.2016, 15:50:32
    Author     : Gregor
--%>

<%@page import="Activity.activityGetter"%>
<%@page import="Hibernate.ActivityReport"%>
<%@page import="Hibernate.Activity"%>
<%@page import="Category.categoryGetter"%>
<%@page import="Hibernate.Category"%>
<%@page import="Hibernate.Category"%>
<%@page import="Hibernate.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div id="foo" class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">Kategorien</div>

            <!-- Table -->
            <table class="table" width=”600px” border=”1″ bgcolor=”#FFF380″> 
                <tr>
                    <th width=”100px”>ID</th>
                    <th width=”100px”>Name</th>
                    <th width="100px">Beschreibung</th>
                    <th width=”100px”>Typ</th>
                    <th width=”100px”>Gesamtzeit</th>

                </tr>
                <tr>   
                    <%
//                        ActivityReport[] ActivityReportArr = activityGetter.getActivityReports();
//                        for (int i = 0; i < ActivityReportArr.length; i++) {
//                            while (ActivityReportArr[i].getActivity().getActivityId() == 1) {
//                                Integer rofl = ActivityReportArr[i].getActivityDuration();
//                                out.println(rofl);
//
//                            }
//
//                        }


                    %>


                    <%                Category[] CategoryArr = categoryGetter.getCategorys();
                        for (int i = 0;
                                i < CategoryArr.length;
                                i++) {

                    %> 
                <tr>
                    <td><b><%=CategoryArr[i].getCategoryId()%></b></td>
                    <td><b><a href="category_update.jsp?ID=<%=CategoryArr[i].getCategoryId()%>"><%=CategoryArr[i].getCategoryName()%></a></b></td>
                    <td><b><%=CategoryArr[i].getCategoryDescription()%></b></td>
                    <td><b><%=CategoryArr[i].getCategoryType()%></b></td>


                    <%
                        }

                        HibernateUtil.getSessionFactory()
                                .getCurrentSession().disconnect();

                    %>               
                </tr>
            </table>
        </div>



    </body>
</html>
