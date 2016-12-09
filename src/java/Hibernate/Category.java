package Hibernate;
// Generated 09.12.2016 10:52:31 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Category generated by hbm2java
 */
public class Category  implements java.io.Serializable {


     private Integer categoryId;
     private String categoryName;
     private String categoryDescription;
     private String categoryType;
     private Set activities = new HashSet(0);

    public Category() {
    }

    public Category(String categoryName, String categoryDescription, String categoryType, Set activities) {
       this.categoryName = categoryName;
       this.categoryDescription = categoryDescription;
       this.categoryType = categoryType;
       this.activities = activities;
    }
   
    public Integer getCategoryId() {
        return this.categoryId;
    }
    
    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
    public String getCategoryName() {
        return this.categoryName;
    }
    
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    public String getCategoryDescription() {
        return this.categoryDescription;
    }
    
    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }
    public String getCategoryType() {
        return this.categoryType;
    }
    
    public void setCategoryType(String categoryType) {
        this.categoryType = categoryType;
    }
    public Set getActivities() {
        return this.activities;
    }
    
    public void setActivities(Set activities) {
        this.activities = activities;
    }




}


