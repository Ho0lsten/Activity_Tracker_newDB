/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parser;

/**
 *
 * @author hools_000
 */
public class stringCutter { 

    public static String cut(String search, String substitute, String str) { 
        int start = str.indexOf(search); 

        while (start != -1) { 
            str = str.substring(0, start) + substitute + str.substring(start + search.length(), str.length()); 
            start = str.indexOf(search, start + substitute.length()); 
        } 
        return (str); 
    } 

  
        //System.out.println(cut("e", "o", str)); 
     
} 
    

