package ${packageName}.service.impl;

import ${packageName}.common.BeanMapper;
import ${packageName}.common.PageTO;
import ${packageName}.common.Query;
import ${packageName}.common.Results;
import ${packageName}.dto.${ObjectNameLower}.req.Create${ObjectName}Req;
import ${packageName}.dto.${ObjectNameLower}.req.Update${ObjectName}Req;
import ${packageName}.dto.${ObjectNameLower}.res.${ObjectName}Res;
import ${packageName}.entity.${ObjectName};
import ${packageName}.mapper.${ObjectName}Mapper;
import ${packageName}.service.${ObjectName}Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 

@Service
public class ${ObjectName}ServiceImpl implements ${ObjectName}Service{
	
    @Autowired
    ${ObjectName}Mapper ${ObjectNameLower}Mapper;

	@Override
	public Results<Boolean> create${ObjectName}(Create${ObjectName}Req create${ObjectName}Req) {
		${ObjectName} record=new ${ObjectName}();
		BeanMapper.copy(create${ObjectName}Req, record);
		return ${ObjectNameLower}Mapper.insertSelective(record) > 0?Results.resultSucc():Results.resultErr();
	}
	
	@Override
	public Results<Boolean> update${ObjectName}(Update${ObjectName}Req update${ObjectName}Req) {
		${ObjectName} record=new ${ObjectName}();
		BeanMapper.copy(update${ObjectName}Req, record);
		return ${ObjectNameLower}Mapper.updateByPrimaryKeySelective(record) > 0?Results.resultSucc():Results.resultErr();
	}
	
	@Override
	public Results<Boolean> delete${ObjectName}(Integer id) {
		return ${ObjectNameLower}Mapper.deleteByPrimaryKey(id) > 0?Results.resultSucc():Results.resultErr();
	}
	
	@Override
	public Results<PageTO<${ObjectName}Res>> selectPage${ObjectName}(Map<String,Object> map) {
		Query query = new Query(map);
		List<${ObjectName}Res> list=BeanMapper.mapList(${ObjectNameLower}Mapper.selectByPage(query), ${ObjectName}Res.class);
		return Results.resultSucc(new PageTO<>(list,${ObjectNameLower}Mapper.${ObjectNameLower}ListTotal(),query));
	}
	
	@Override
	public Results<${ObjectName}Res> selectById(Integer id) {
		${ObjectName} record = ${ObjectNameLower}Mapper.selectByPrimaryKey(id);
		BeanMapper.copy(record, ${ObjectName}Res.class);
		return Results.resultSucc(record);
	}
}