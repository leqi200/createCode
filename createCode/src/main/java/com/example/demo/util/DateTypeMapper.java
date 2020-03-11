package com.example.demo.util;

public class DateTypeMapper {
	
	public String DateTypeXml(String dateType) {
		switch (dateType) {
		case "int":
			return "INTEGER";
		case "varchar":
			return "VARCHAR";
		case "DATE":
			return "TIMESTAMP";
		default:
			return dateType.toUpperCase();
		}
	}

	
	public String JavaType(String javaType) {
		switch (javaType) {
		case "varchar":
			return "String";
		case "text":
			return "String";
		case "bigint":
			return "long";
		case "date":
			return "Date";
		case "datetime":
			return "Date";
		case "smallint":
			return "int";
		case "tinyint":
			return "int";
		default:
			return javaType;
		}
	}
}
