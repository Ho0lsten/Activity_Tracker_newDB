/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Category;

import Hibernate.Category;
import Hibernate.HibernateUtil;
import org.hibernate.Session;

/**
 *
 * @author hools_000
 */
public class categoryDelete {

public static void categoryDeleteById(Integer catid)
{
    Session session2;
    Category category ;
    session2 = HibernateUtil.getSessionFactory().openSession();
    session2.beginTransaction();
    category = (Category)session2.load(Category.class,catid);
    session2.delete(category);
    //This makes the pending delete to be done
     session2.getTransaction().commit();
}
    
}
    

