package Hibernate;
// Generated 09.12.2016 13:25:19 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Activity generated by hbm2java
 */
public class Activity  implements java.io.Serializable {


     private Integer activityId;
     private Category category;
     private String activityName;
     private Set activityReports = new HashSet(0);

    public Activity() {
    }

    public Activity(Category category, String activityName, Set activityReports) {
       this.category = category;
       this.activityName = activityName;
       this.activityReports = activityReports;
    }
   
    public Integer getActivityId() {
        return this.activityId;
    }
    
    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }
    public Category getCategory() {
        return this.category;
    }
    
    public void setCategory(Category category) {
        this.category = category;
    }
    public String getActivityName() {
        return this.activityName;
    }
    
    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }
    public Set getActivityReports() {
        return this.activityReports;
    }
    
    public void setActivityReports(Set activityReports) {
        this.activityReports = activityReports;
    }




}


