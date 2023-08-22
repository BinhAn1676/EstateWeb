package com.laptrinhjavaweb.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

public class CastingUtils {
	public static List<?> convertObjectToList(Object obj) {
	    List<?> list = new ArrayList<>();
	    if (obj.getClass().isArray()) {
	        list = Arrays.asList((Object[])obj);
	    } else if (obj instanceof Collection) {
	        list = new ArrayList<>((Collection<?>)obj);
	    }
	    return list;
	}
	public static boolean canParse(String s){
		try {
			Integer.parseInt(s);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}
}
