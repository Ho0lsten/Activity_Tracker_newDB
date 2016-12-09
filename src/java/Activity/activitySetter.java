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

    public static void createActivity(String activityName, String activityDescription, Category category) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Activity act = new Activity();
        act.setActivityName(activityName);
        act.setCategory(category);
        session.save(act);
        session.getTransaction().commit();

    }

    public static void updateActivityById(Integer activityId, String activityName, Category category) {
        Session session2 = HibernateUtil.getSessionFactory().openSession();
        session2.beginTransaction();
        Activity updateAct = new Activity();
        updateAct = (Activity) session2.get(Category.class, activityId);
        Hibernate.initialize(updateAct);
        updateAct.setActivityName(activityName);
        session2.merge(updateAct);
        session2.saveOrUpdate(updateAct);
        session2.getTransaction().commit();

    }

    public static void createActivityReport(Activity activity, Timestamp activityStartTime, Timestamp activityEndTime, String activityDescription) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        ActivityReport act = new ActivityReport();
        act.setActivity(activity);
        act.setActivityStartTime(activityStartTime);
        act.setActivityEndTime(activityEndTime);
        act.setActivityDescription(activityDescription);
        session.save(act);
        session.getTransaction().commit();

    }

}
