package com.example.demo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface CreateCodeMapper {

	@Select("select count(*) from TABLES where TABLE_SCHEMA=#{databaseName} and TABLE_NAME=#{tableName}")
	public int IsTable(String databaseName,String tableName);
	
	@Select("select * from information_schema.COLUMNS where TABLE_SCHEMA = #{databaseName} and TABLE_NAME=#{tableName}")
	public List<Map> listTableColumn(String databaseName,String tableName);
	
}
