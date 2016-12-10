/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Activity;

import Hibernate.Activity;
import Hibernate.ActivityReport;
import Hibernate.Category;
import Hibernate.HibernateUtil;
import java.sql.Timestamp;
import org.hibernate.Hibernate;
import org.hibernate.Session;

/**
 *
 * @author MM-Produktion
 */
public class activitySetter {

    public static void createActivity(String activityName, Category category) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Activity act = new Activity();
        act.setActivityName(activityName);
        act.setCategory(category);
        session.save(act);
        session.getTransaction().commit();

    }

    public static void updateActivityById(Integer activityId, String activityName, Category category) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Activity updateAct = new Activity();
        updateAct = (Activity) session.get(Activity.class, activityId);
        Hibernate.initialize(updateAct);
        updateAct.setActivityName(activityName);
        updateAct.setCategory(category);
        session.merge(updateAct);
        session.saveOrUpdate(updateAct);
        session.getTransaction().commit();

    }

    public static void createActivityReport(Activity activity, String activityDescription, Timestamp activityStartTime, Timestamp activityEndTime, Integer ActivityDuration) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        ActivityReport actRep = new ActivityReport();
        actRep.setActivity(activity);
        actRep.setActivityDescription(activityDescription);
        actRep.setActivityStartTime(activityStartTime);
        actRep.setActivityEndTime(activityEndTime);
        actRep.setActivityDuration(ActivityDuration);
        session.save(actRep);
        session.getTransaction().commit();

    }

    public static void updateActivityReportById(Integer activityReportId, Activity activity, String activityDescription, Timestamp activityStartTime, Timestamp activityEndTime) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        ActivityReport updateActRep = new ActivityReport();
        updateActRep = (ActivityReport) session.get(ActivityReport.class, activityReportId);
        Hibernate.initialize(updateActRep);
        updateActRep.setActivity(activity);
        updateActRep.setActivityDescription(activityDescription);
        updateActRep.setActivityStartTime(activityStartTime);
        updateActRep.setActivityEndTime(activityEndTime);
        session.merge(updateActRep);
        session.saveOrUpdate(updateActRep);
        session.getTransaction().commit();

    }

}
