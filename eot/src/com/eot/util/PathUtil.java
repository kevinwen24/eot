package com.eot.util;


public class PathUtil {
	
	private static String contextPath;
	
	public static String getFullPath(String path){
		if (path == null) {
            path = "";
        }
		
		return "" + contextPath + "/page/" + path;
	}
	
	public static void setContextPath(String contextPa){
		contextPath = contextPa;
	}
}
