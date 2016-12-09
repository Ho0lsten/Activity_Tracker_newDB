/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parser;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 *
 * @author hools_000
 */
public class durationCalc {

    public static long calculateDuration(Timestamp activityStartTime, Timestamp activityEndTime) {
        long diffDays;
        long diffHours;
        long diffMinutes;
        long diffSeconds ;


//         Timestamp startStamp = Timestamp activityStartTime;
                //                Timestamp endStamp = Timestamp activityStartTime;
                //                long duration = endDate.getTime() - startDate.getTime();
                //
                //        long diffInSeconds = TimeUnit.MILLISECONDS.toSeconds(duration);
                //        long diffInMinutes = TimeUnit.MILLISECONDS.toMinutes(duration);
                //        long diffInHours = TimeUnit.MILLISECONDS.toHours(duration);
                //        String dateStart = "01/14/2012 09:29:58";
                //        String dateStop = "01/15/2012 10:31:48";
                //HH converts hour in 24 hours format (0-23), day calculation
                //        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
                //        Timestamp d1 = null;
                //        Timestamp d2 = null;
        try {
            //in milliseconds
            long diff = activityEndTime.getTime() - activityStartTime.getTime();

            diffSeconds = diff / 1000 % 60;
            diffMinutes = diff / (60 * 1000) % 60;
            diffHours = diff / (60 * 60 * 1000) % 24;
            diffDays = diff / (24 * 60 * 60 * 1000);
            

//            System.out.print(diffDays + " days, ");
//            System.out.print(diffHours + " hours, ");
//            System.out.print(diffMinutes + " minutes, ");
//            System.out.print(diffSeconds + " seconds.");
        } catch (Exception e) {
            System.out.println("Exception :" + e);
            throw e;
        }
        return diffDays;
     
    }
}
