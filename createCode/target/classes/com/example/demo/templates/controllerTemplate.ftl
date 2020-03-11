package ${packageName}.controller;



import java.util.Map;
import java.util.Date;


import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ${packageName}.common.PageTO;
import ${packageName}.common.Results;
import ${packageName}.dto.${ObjectNameLower}.req.Create${ObjectName}Req;
import ${packageName}.dto.${ObjectNameLower}.req.Update${ObjectName}Req;
import ${packageName}.dto.${ObjectNameLower}.res.${ObjectName}Res;
import ${packageName}.service.${ObjectName}Service;

import io.swagger.annotations.ApiOperation;
 

/** 
 * 创建时间：${nowDate?string("yyyy-MM-dd")}
 */
@RestController
@RequestMapping("/${ObjectName}")
public class ${ObjectName}Controller {
 
    @Autowired
    private ${ObjectName}Service ${ObjectNameLower}Service;
    
    @ApiOperation("添加${ObjectName}")
    @PostMapping("/create${ObjectName}")
    public Results<Boolean> create(@RequestBody @Validated Create${ObjectName}Req create${ObjectName}Req) {
    	return ${ObjectNameLower}Service.create${ObjectName}(create${ObjectName}Req);
    }
    
    @ApiOperation("根据Id修改${ObjectName}")
    @PostMapping("/update${ObjectName}")
    public Results<Boolean> update(@RequestBody @Validated Update${ObjectName}Req update${ObjectName}Req) {
    	return ${ObjectNameLower}Service.update${ObjectName}(update${ObjectName}Req);
    }
    
    @ApiOperation("查询页面")
    @PostMapping("/selectByPage${ObjectName}")
    public Results<PageTO<${ObjectName}Res>> selectByPage(@RequestParam Map<String,Object> map) {
    	return ${ObjectNameLower}Service.selectPage${ObjectName}(map);
    }
    
    @ApiOperation("根据Id查询${ObjectName}")
    @GetMapping("/selectById/{id}")
    public Results<${ObjectName}Res> selectById(@PathVariable("id")Integer id){
    	return ${ObjectNameLower}Service.selectById(id);
    }
    
    @ApiOperation("根据Id删除${ObjectNameLower}")
    @Delete("/delete${ObjectName}/{id}")
    public Results<Boolean> delete(@PathVariable("id")Integer id) {
    	return ${ObjectNameLower}Service.delete${ObjectName}(id);
    }

}
