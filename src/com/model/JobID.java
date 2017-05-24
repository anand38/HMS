package com.model;

import java.util.HashMap;

/**
 * Created by anand38 on 24/5/17.
 * Here all the Id's assigned to position are defined
 */
public class JobID {

   static HashMap<String,Integer> map=new HashMap<>();
    private static void populatejobId(){
        map.put("Software Engineer",426783919);
        map.put("Technical Lead",479613509);
        map.put("Database Administrator",158476099);
        map.put("Project Manager",923814759);
        map.put("System Engineer",250617389);
        map.put("Junior Consultant",701243569);
        map.put("Hadoop Developer",921387509);
    }
    public static int getID(String position){
    populatejobId();
    return map.get(position);
    }
}
