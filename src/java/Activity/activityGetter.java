/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Activity;

import Hibernate.Activity;
import Hibernate.ActivityReport;
import Hibernate.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author MM-Produktion
 */
public class activityGetter {

    public static Activity[] getActivities() {

        //create SessionFactory object for opening Session
        //SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session;
        //Criteria requires a transaction opened
        session = HibernateUtil.getSessionFactory().openSession();
        //create Criteria for Customer class
        Criteria criteria = session.createCriteria(Activity.class);
        //add a Restriction which will be used for equality –> state = ‘MI’
        //criteria.add(Restrictions.eq(“state”, stateName));
        //add an order for using customer_ID column
        //criteria.addOrder(Order.asc(“customer_ID”));
        //return the resultset as a List
        List<Activity> Activityresult = criteria.list();

        //convert List to Array
        return Activityresult.toArray(new Activity[Activityresult.size()]);

    }

    public static Activity getActivityById(int activityId) {
        Session session;
        Activity activity = new Activity();
        try {
            session = HibernateUtil.getSessionFactory().openSession();

            activity = (Activity) session.get(Activity.class, activityId);
            Hibernate.initialize(activity);
            // List<Category> Categoryresult = criteria.list();

        } catch (HibernateException e) {
            throw e;
        }
        return activity;
    }

    public static ActivityReport[] getActivityReports() {

        //create SessionFactory object for opening Session
        //SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session;
        //Criteria requires a transaction opened
        session = HibernateUtil.getSessionFactory().openSession();
        //create Criteria for Customer class
        Criteria criteria = session.createCriteria(ActivityReport.class);
        //add a Restriction which will be used for equality –> state = ‘MI’
        //criteria.add(Restrictions.eq(“state”, stateName));
        //add an order for using customer_ID column
        //criteria.addOrder(Order.asc(“customer_ID”));
        //return the resultset as a List
        List<ActivityReport> ActivityReportresult = criteria.list();

        //convert List to Array
        return ActivityReportresult.toArray(new ActivityReport[ActivityReportresult.size()]);

    }

    public static ActivityReport getActivityReportById(int categoryId) {
        Session session;
        ActivityReport activityReport = new ActivityReport();
        try {
            session = HibernateUtil.getSessionFactory().openSession();

            activityReport = (ActivityReport) session.get(ActivityReport.class, categoryId);
            Hibernate.initialize(activityReport);
            // List<Category> Categoryresult = criteria.list();

        } catch (HibernateException e) {
            throw e;
        }
        return activityReport;
    }
}
