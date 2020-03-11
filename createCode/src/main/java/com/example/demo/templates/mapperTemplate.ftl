package ${packageName}.mapper;


import ${packageName}.entity.${ObjectName};

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
 

@Repository
public interface ${ObjectName}Mapper {
    
    /** 
   	   *根据ID删除
     * @param id 主键ID
     */
    int deleteByPrimaryKey(Integer id);

    /** 
                  * 添加对象所有字段
     * @param record 插入字段对象(必须含ID）
     */
    int insert(${ObjectName} record);

    /** 
  	    * 添加对象对应字段
     * @param record 插入字段对象(必须含ID）
     */
    int insertSelective(${ObjectName} record);

    /** 
 	    * 根据ID查询
     * @param id 主键ID
     */
    ${ObjectName} selectByPrimaryKey(Integer id);

    /** 
	     * 根据ID修改对应字段
     * @param record 修改字段对象(必须含ID）
     */
    int updateByPrimaryKeySelective(${ObjectName} record);

    /** 
	     * 根据ID修改所有字段(必须含ID）
     * @param record 修改字段对象(必须含ID）
     */
    int updateByPrimaryKey(${ObjectName} record);
    
    /** 
	     * 查询页面数据
     * @param Map<String,Object>
     */
    List<${ObjectName}> selectByPage(Map<String,Object> map);
    
    /** 
	     * 查询总条数
     */
    int ${ObjectNameLower}ListTotal();
}