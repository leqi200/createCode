<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${packageName}.mapper.${ObjectName}Mapper">
 
 	<sql id="tableName">
 		${tableName}
 	</sql>
 
    <resultMap id="BaseResultMap" type="${packageName}.entity.${ObjectName}">
        <#list tablecolumns as var>
        	<result column="${var.COLUMN_NAME}" jdbcType="${var.DATATYPE}" property="${var.columnName}" />
        </#list>
    </resultMap>
 
 	<!-- 字段 -->
 	<sql id="Base_Column_List">
 		<#assign index = 0>
		<#list tablecolumns as var>
			<#if index !=0>,</#if>
			${var.COLUMN_NAME}
			<#assign index = index + 1>
		</#list>
	</sql>
	
	<!-- 字段值 -->
	<sql id="FieldValue">
		<#assign index = 0>
		<#list tablecolumns as var>
			<#if index !=0>,</#if>
			${r"#{"}${var.columnName}${r"}"}
			<#assign index = index + 1>	
		</#list>
	</sql>
	
	<select id="selectByPrimaryKey" parameterType="java.lang.Integer"
		resultMap="BaseResultMap">
		SELECT
		<include refid="Base_Column_List" />
		FROM <include refid="tableName" />
		WHERE ${idMap.COLUMN_NAME} = ${r"#{"}${idMap.columnName}${r",jdbcType="}${idMap.DATATYPE}${r"}"}
	</select>
	
	<select id="selectByPage" resultMap="BaseResultMap">
		SELECT <include refid="Base_Column_List"/>
		FROM <include refid="tableName" />
		<where>
			1 = 1
		</where>
		<choose>
			<when test="sidx != null and sidx.trim() != ''">
				order by ${r"#{sidx}"} ${r"#{order}"}
			</when>
		</choose>
		<if test="offset != null and limit != null">
			limit ${r"#{offset}"},${r"#{limit}"}
		</if>
	</select>
	
	<select id="userListTotal" resultType="java.lang.Integer">
		select count(*) FROM <include refid="tableName" />
	</select>
	
	<delete id="deleteByPrimaryKey" parameterType="java.lang.Integer">
		DELETE FROM <include refid="tableName" />
		WHERE ${idMap.COLUMN_NAME} = ${r"#{"}${idMap.columnName}${r",jdbcType="}${idMap.DATATYPE}${r"}"}
	</delete>
	
	<insert id="insert" parameterType="${packageName}.entity.${ObjectName}">
		INSERT INTO <include refid="tableName" /> 
		(<include refid="Base_Column_List" />)
		VALUES (<include refid="FieldValue" />)
	</insert>
	
	<insert id="insertSelective" parameterType="${packageName}.entity.${ObjectName}">
		INSERT INTO <include refid="tableName" />
		<trim prefix="(" suffix=")" suffixOverrides=",">
			<#list tablecolumns as var>
				<if test="${var.columnName} != null">
					${var.COLUMN_NAME},
				</if>
			</#list>
		</trim>
		<trim prefix="VALUES (" suffix=")" suffixOverrides=",">
			<#list tablecolumns as var>
				<if test="${var.columnName} != null">
					${r"#{"}${var.columnName}${r",jdbcType="}${var.DATATYPE}${r"}"},
				</if>
			</#list>
		</trim>
	</insert>
	
	<update id="updateByPrimaryKeySelective" parameterType="${packageName}.entity.${ObjectName}">
		UPDATE <include refid="tableName" />
		<set>
			<#list tablecolumns as var>
				<if test="${var.columnName} != null">
					${var.COLUMN_NAME}=${r"#{"}${var.columnName}${r",jdbcType="}${var.DATATYPE}${r"}"},
				</if>
			</#list>
		</set>
		WHERE ${idMap.COLUMN_NAME} = ${r"#{"}${idMap.columnName}${r",jdbcType="}${idMap.DATATYPE}${r"}"}
	</update>
 
 
 	<update id="updateByPrimaryKey" parameterType="${packageName}.entity.${ObjectName}">
 		UPDATE <include refid="tableName" />
		SET 			
			<#list tablecolumns as var>
				${var.COLUMN_NAME}=${r"#{"}${var.columnName}${r",jdbcType="}${var.DATATYPE}${r"}"},
			</#list>
		WHERE ${idMap.COLUMN_NAME} = ${r"#{"}${idMap.columnName}${r",jdbcType="}${idMap.DATATYPE}${r"}"}
 	</update>
</mapper>