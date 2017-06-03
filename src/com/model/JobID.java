package com.model;

import java.util.HashMap;

/**
 * Created by anand38 on 24/5/17.
 * Here all the Id's assigned to position are defined
 */
public class JobID {
    private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    public static String getID() {
        int count=10;
        StringBuilder builder = new StringBuilder();
        while (count-- != 0) {
            int character = (int)(Math.random()*ALPHA_NUMERIC_STRING.length());
            builder.append(ALPHA_NUMERIC_STRING.charAt(character));
        }
        return builder.toString();
    }
}
