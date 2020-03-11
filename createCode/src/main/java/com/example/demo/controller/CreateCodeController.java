package com.example.demo.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.common.Results;
import com.example.demo.service.CreateCodeService;

import freemarker.template.Configuration;
import freemarker.template.Template;

@RestController
@RequestMapping("/testBoot")
public class CreateCodeController {
	
	@Autowired
	private CreateCodeService createCodeService;



	@PostMapping("/createCode")
	public Results createCode(String databaseName, String tableName, String packageName) throws Exception {
		return createCodeService.CreatCode(databaseName, tableName, packageName);
	}
	
		
	@PostMapping("/databaseInfo")
	public Results<List<Map>> info(String databaseName, String tableName) {
        return createCodeService.tableInfo(databaseName, tableName);
    }

}
