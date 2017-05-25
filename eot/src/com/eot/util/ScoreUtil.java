package com.eot.util;

public class ScoreUtil {
	
	public static float getScore(String str){
		float score = 0;
		
		switch(str){
			case "A" : score = 95 ;break;
			case "B" : score = 85 ;break;
			case "C" : score = 70 ;break;
			case "D" : score = 60 ;break;
			case "E" : score = 50 ;break;
			default : score = 0;
		}
		return score;
	}
}
