package com.eot.util;

public class GetterUtil {
	
	public static boolean isNum(String str){
		if(str == null){
			return false;
		}
		return str.matches("[0-9]*");
	}
}
