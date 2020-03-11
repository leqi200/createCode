package com.example.demo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.common.Results;

public interface CreateCodeService {
	
	Results CreatCode(String databaseName, String tableName, String packageName) throws Exception;

	Results<List<Map>> tableInfo(String databaseName, String tableName);
	
}
