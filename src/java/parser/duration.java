/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parser;

import Activity.activityGetter;
import Hibernate.Activity;
import Hibernate.ActivityReport;
import Hibernate.HibernateUtil;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author Gregor
 */
public class duration {

    public static String getActivityReportDurationById(Integer ActivityReportId) {

        Session session;
        ActivityReport actRep = new ActivityReport();

        session = HibernateUtil.getSessionFactory().openSession();
        actRep = (ActivityReport) session.get(ActivityReport.class, ActivityReportId);
        Hibernate.initialize(actRep);
        Integer ActivityDuration = actRep.getActivityDuration();
        Integer numberOfDays = ActivityDuration / 86400;
        Integer numberOfHours = (ActivityDuration % 86400) / 3600;
        Integer numberOfMinutes = ((ActivityDuration % 86400) % 3600) / 60;
        Integer numberOfSeconds = ((ActivityDuration % 86400) % 3600) % 60;

        return (numberOfDays + " T " + numberOfHours + " Std " + numberOfMinutes + " Min " + numberOfSeconds + " Sek ");

    }

//    public static String getCategoryDurationById(int CategoryId) {
//
//        Session session;
//        Activity actRep = new Activity();
//
//        session = HibernateUtil.getSessionFactory().openSession();
//        actRep = (Activity) session.get(Activity.class, CategoryId);
//        Hibernate.initialize(actRep);
//
//        Category category = new Category();
//            Integer categoryid = Integer.parseInt(s2);
//            category.setCategoryId(categoryid);
//
//       ActivityReport[] ActivityReportArr = activityGetter.getActivitiesByCategoryId(CategoryId);
//        //Activity[] ActivityArr = activityGetter.getActivitiesByCategoryId(Activity.getCategory(CategoryId));
//        for (int i = 0; i < ActivityArr.length; i++) {
//            Integer ActivityDuration = actRep.getActivityDuration();
//
//            Integer numberOfDays = ActivityDuration / 86400;
//            Integer numberOfHours = (ActivityDuration % 86400) / 3600;
//            Integer numberOfMinutes = ((ActivityDuration % 86400) % 3600) / 60;
//            Integer numberOfSeconds = ((ActivityDuration % 86400) % 3600) % 60;
//
//            return (numberOfDays + " T " + numberOfHours + " Std " + numberOfMinutes + " Min " + numberOfSeconds + " Sek ");
//
//        }
    }
