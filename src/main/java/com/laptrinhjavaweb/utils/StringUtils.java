package com.laptrinhjavaweb.utils;

public class StringUtils {
	public static <T> boolean isNullOrEmpty(T value) {
		if(value!=null&&value!="") {
			return false;
		}
		return true;
	}

}
