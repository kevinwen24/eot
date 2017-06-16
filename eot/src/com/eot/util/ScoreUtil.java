package com.eot.util;

public class ScoreUtil {
	
	public static float getScore(String str){
		float score = 0;
		
		switch(str){
			case "A" : score = 9 ;break;
			case "B" : score = 8 ;break;
			case "C" : score = 7 ;break;
			case "D" : score = 6 ;break;
			case "E" : score = 5 ;break;
			default : score = 0;
		}
		return score;
	}
}
