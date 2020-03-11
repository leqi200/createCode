package com.example.demo.service.impl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.common.Results;
import com.example.demo.mapper.CreateCodeMapper;
import com.example.demo.service.CreateCodeService;
import com.example.demo.util.DateTypeMapper;
import com.example.demo.util.DelAllFile;
import com.example.demo.util.FileDownload;
import com.example.demo.util.FileZip;
import com.example.demo.util.Freemarker;
import com.example.demo.util.PathUtil;
import com.example.demo.util.StringUtil;

import freemarker.template.Configuration;
import freemarker.template.Template;

@Service
public class CreateCodeServiceImpl implements CreateCodeService{
	
	@Autowired
	private CreateCodeMapper createCodeMapper;
	
	private static final String TEMPLATE_PATH = "src/main/java/com/example/demo/templates";
	private static final String CLASS_PATH = "src/main/java/com/example/demo";
	private static final String PACKAGE_NAME = "com.example.demo";
	
	public Results CreatCode(String databaseName, String tableName, String packageName) throws Exception {
		
		DateTypeMapper dateTypeMapper = new DateTypeMapper();
		//查询是否有该表
		int isTable = createCodeMapper.IsTable(databaseName, tableName);
		System.out.println("isTable :  "+isTable);
		if(isTable<1) {
			return Results.resultErr("该数据库找不到该表");
		}
		//查询该表的结构
		List<Map> tablecolumns = createCodeMapper.listTableColumn(databaseName, tableName);
		List<Map> tablelist=new ArrayList<Map>();
		Map idMap = new HashMap();
		String columnName="";
		String dateType="";
		String javaType="";
		for(Map column: tablecolumns) {
			columnName=StringUtil.deleteSymbol(column.get("COLUMN_NAME").toString(), "_");
			column.put("columnName", columnName);
			dateType=column.get("DATA_TYPE").toString();
			column.put("DATATYPE", dateTypeMapper.DateTypeXml(dateType));
			dateType=column.get("DATA_TYPE").toString();
			column.put("JAVATYPE", dateTypeMapper.JavaType(javaType));
			if(column.get("COLUMN_KEY").equals("PRI")) {
				idMap=column;
			}
			tablelist.add(column);
		}
		
		//将tableName字符串进行处理
		String ObjectName = StringUtil.tableNameToClassName(tableName);
		String ObjectNameLower = StringUtil.classNameFirstToLower(ObjectName);
		
		Map<String,Object> root = new HashMap<String,Object>();
		root.put("tablecolumns", tablelist);
		root.put("packageName", packageName);
		root.put("ObjectName", ObjectName);
		root.put("ObjectNameLower", ObjectNameLower);
		root.put("nowDate", new Date());
		root.put("tableName", tableName);
		root.put("databaseName", databaseName);
		root.put("idMap", idMap);
		
		DelAllFile.delFolder(TEMPLATE_PATH+"/code");
		
		try {
			/*生成controller*/
			Freemarker.printFile("controllerTemplate.ftl", root, "/code/"+ObjectName+"Controller.java", TEMPLATE_PATH,TEMPLATE_PATH);
			
			/*生成service*/
			Freemarker.printFile("serviceTemplate.ftl", root, "/code/"+ObjectName+"Service.java", TEMPLATE_PATH, TEMPLATE_PATH);
			Freemarker.printFile("serviceImplTemplate.ftl", root, "/code/"+ObjectName+"ServiceImpl.java", TEMPLATE_PATH, TEMPLATE_PATH);
			
			/*生成mapper*/
			Freemarker.printFile("mapperTemplate.ftl", root, "/code/"+ObjectName+"Mapper.java", TEMPLATE_PATH, TEMPLATE_PATH);
			
			/*生成mybatis xml*/
			Freemarker.printFile("mapperXmlTemplate.ftl", root, "/code/"+ObjectName+"Mapper.xml", TEMPLATE_PATH, TEMPLATE_PATH);
			
			/*生成entity*/
			Freemarker.printFile("entityTemplate.ftl", root, "/code/"+ObjectName+".java", TEMPLATE_PATH, TEMPLATE_PATH);
			Freemarker.printFile("createReqTemplate.ftl", root, "/code/Create"+ObjectName+"Req.java", TEMPLATE_PATH, TEMPLATE_PATH);
			Freemarker.printFile("updateReqTemplate.ftl", root, "/code/Update"+ObjectName+"Req.java", TEMPLATE_PATH, TEMPLATE_PATH);
			Freemarker.printFile("resTemplate.ftl", root, "/code/"+ObjectName+"Res.java", TEMPLATE_PATH, TEMPLATE_PATH);
			return Results.resultSucc();
		}catch (Exception e) {
			return Results.resultErr(e);
		}

	}

	@Override
	public Results<List<Map>> tableInfo(String databaseName, String tableName) {
		//查询是否有该表
		int num = createCodeMapper.IsTable(databaseName, tableName);
		System.out.println("num :  "+num);
		//查询该表的结构
		List<Map> tablecolumns = createCodeMapper.listTableColumn(databaseName, tableName);
		List<Map> tablelist=new ArrayList<Map>();
		String columnName="";
		for(Map column: tablecolumns) {
			columnName=StringUtil.deleteSymbol(column.get("COLUMN_NAME").toString(), "_");
			column.put("columnName", columnName);
			tablelist.add(column);
		}
		return Results.resultSucc(tablelist);
	}

}
