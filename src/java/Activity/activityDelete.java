/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Activity;

import Hibernate.Activity;
import Hibernate.ActivityReport;
import Hibernate.HibernateUtil;
import org.hibernate.Session;

/**
 *
 * @author MM-Produktion
 */
public class activityDelete {
    
    public static void activityDeleteById(Integer id)
{
    Session session;
    Activity activity ;
    session = HibernateUtil.getSessionFactory().openSession();
    session.beginTransaction();
    activity = (Activity)session.load(Activity.class,id);
    session.delete(activity);
    //This makes the pending delete to be done
     session.getTransaction().commit();
}
    
        public static void activityReportDeleteById(Integer actid)
{
    Session session;
    ActivityReport activityReport ;
    session = HibernateUtil.getSessionFactory().openSession();
    session.beginTransaction();
    activityReport = (ActivityReport)session.load(ActivityReport.class,actid);
    session.delete(activityReport);
    //This makes the pending delete to be done
     session.getTransaction().commit();
    
    
}
}