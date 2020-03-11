package com.example.demo.util;

public class StringUtil {
	
	public static String tableNameToClassName(String tableName) {
		String[] namearray = tableName.split("_");
		String name = "";
		for(String namegroup: namearray) {
		    String first = namegroup.substring(0, 1);
		    String after = namegroup.substring(1); 
		    first = first.toUpperCase();
	        name = name+ first+ after;
		}
		return name;
	}
	
	public static String classNameFirstToLower(String ObjectName) {
	    String first = ObjectName.substring(0, 1);
	    String after = ObjectName.substring(1); 
	    first = first.toLowerCase();
        String name = first+ after;
        return name;
	}
	
	public static String deleteSymbol(String ObjectName,String symbol) {
		String[] namearray = ObjectName.split("_");
		String name = "";
		for(String namegroup: namearray) {
		    String first = namegroup.substring(0, 1);
		    String after = namegroup.substring(1); 
		    first = first.toUpperCase();
	        name = name+ first+ after;
		}
	    String first = name.substring(0, 1);
	    String after = name.substring(1); 
	    first = first.toLowerCase();
        name = first+ after;
        return name;
	}

}
