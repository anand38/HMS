package com.bean;

import org.json.JSONObject;

public class JsonProvider {
private static JSONObject object;

    public static JSONObject getObject() {
        return object;
    }

    public static void setObject(JSONObject obj) {
        object=obj;
    }
}
