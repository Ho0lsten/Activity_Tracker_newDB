/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Category;

import Hibernate.Category;
import Hibernate.HibernateUtil;
import org.hibernate.Hibernate;
import org.hibernate.Session;

/**
 *
 * @author MM-Produktion
 */
public class categorySetter {

    public static void createCat(String categoryName, String categoryType, String categoryDescription) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Category cat = new Category();
        cat.setCategoryName(categoryName);
        cat.setCategoryType(categoryType);
        cat.setCategoryDescription(categoryDescription);
        session.save(cat);
        session.getTransaction().commit();

    }
    
    public static void updateCategoryById (Integer categoryId, String categoryName, String categoryDescription, String categoryType){
        Session session2 = HibernateUtil.getSessionFactory().openSession();
        session2.beginTransaction();
        Category updateCat = new Category();
        updateCat = (Category) session2.get(Category.class, categoryId);
        Hibernate.initialize(updateCat);
        updateCat.setCategoryName(categoryName);
        updateCat.setCategoryDescription(categoryDescription);
        updateCat.setCategoryType(categoryType);
        session2.merge(updateCat);
        session2.saveOrUpdate(updateCat);
        session2.getTransaction().commit();        
        
    }
    
}
