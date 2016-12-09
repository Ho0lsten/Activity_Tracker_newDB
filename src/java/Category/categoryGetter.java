/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Category;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import java.util.Date;
import java.util.List;
import org.hibernate.*;
import Hibernate.*;
import static java.lang.System.out;
import org.hibernate.Criteria;

/**
 *
 * @author MM-Produktion
 */
public class categoryGetter {

    /**
     *
     * @param categoryId
     * @return CategoryName
     */
    public static String getCategoryNameById(int categoryId) {
        Session session;
        Category category = new Category();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            category = (Category) session.get(Category.class, categoryId);
            Hibernate.initialize(category);

        } catch (HibernateException e) {

        }

        return category.getCategoryName();

    }

    /**
     *
     * @return Category Array
     */
    public static Category[] getCategorys() {

        //create SessionFactory object for opening Session
        // SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session;
        //Criteria requires a transaction opened
        session = HibernateUtil.getSessionFactory().openSession();
        //create Criteria for Customer class
        Criteria criteria = session.createCriteria(Category.class);
        //add a Restriction which will be used for equality –> state = ‘MI’
        //criteria.add(Restrictions.eq(“state”, stateName));
        //add an order for using customer_ID column
        //criteria.addOrder(Order.asc(“customer_ID”));
        //return the resultset as a List
        List<Category> Categoryresult = criteria.list();

        //convert List to Array
        return Categoryresult.toArray(new Category[Categoryresult.size()]);

    }

    public static Category getCategoryById(int categoryId) {
        Session session;
        Category category = new Category();
        try {
            session = HibernateUtil.getSessionFactory().openSession();

            category = (Category) session.get(Category.class, categoryId);
            Hibernate.initialize(category);
            // List<Category> Categoryresult = criteria.list();

        } catch (HibernateException e) {
            throw e;
        }
        return category;
    }
}
