package com.eot.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	public static String getYear(Date date) {
		return new SimpleDateFormat("yyyy").format(date);
	}
	
	public static int getTerm(Date date) {
		String month = new SimpleDateFormat("MM").format(date);
		if (month.startsWith("0")) {
			if(Integer.parseInt(month.substring(1,2)) <= 7) {
				return 0;
			} else {
				return 1;
			}
		} else {
			return 1;
		}
	}
}
