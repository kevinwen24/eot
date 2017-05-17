package com.eot.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertyUtil {
	private static Properties pro;
	
	static {
		 InputStream is = PropertyUtil.class.getClassLoader().getResourceAsStream("app.properties");
		 pro = new Properties();
		 try {
			pro.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String getProperties(String key) {
		return pro.getProperty(key);
	}
	
	public static String getStaticUrl() {
        return pro.getProperty("static.url");
    }
}
