package ${packageName}.service;

import java.util.Map;

import ${packageName}.common.PageTO;
import ${packageName}.common.Results;
import ${packageName}.dto.${ObjectNameLower}.req.Create${ObjectName}Req;
import ${packageName}.dto.${ObjectNameLower}.req.Update${ObjectName}Req;
import ${packageName}.dto.${ObjectNameLower}.res.${ObjectName}Res;

public interface ${ObjectName}Service {
	
	public Results<Boolean> create${ObjectName}(Create${ObjectName}Req create${ObjectName}Req);
	
	public Results<Boolean> update${ObjectName}(Update${ObjectName}Req update${ObjectName}Req);
	
	public Results<Boolean> delete${ObjectName}(Integer id);
	
	public Results<PageTO<${ObjectName}Res>> selectPage${ObjectName}(Map<String,Object> map);
	
	public Results<${ObjectName}Res> selectById(Integer id);

}