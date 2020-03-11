package com.example.demo.entity;

import java.util.Date;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 
  *${tableName}
 * date:${nowDate?string("yyyy-MM-dd")}
 */
@Data
public class ${ObjectName} {
	
    <#list tablecolumns as var>
    	@ApiModelProperty("${var.COLUMN_COMMENT}")
    	private	${var.JAVATYPE} ${var.columnName};
    </#list>
	
}