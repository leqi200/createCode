package ${packageName}.dto.${ObjectName}.req;


import java.util.Date;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 
 * date:${nowDate?string("yyyy-MM-dd")}
 */
@Data
public class Update${ObjectName}Req {
	
    <#list tablecolumns as var>
    	@ApiModelProperty("${var.COLUMN_COMMENT}")
    	private	${var.DATA_TYPE?switch('varchar' , 'String', 'text', 'String', 'bigint', 'long', 'date', 'Date', 'datetime', 'Date', 'smallint', 'int', ''tinyint, 'int', var.DATA_TYPE)} ${var.columnName};
    </#list>
	
}