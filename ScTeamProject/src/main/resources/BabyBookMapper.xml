<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">


<mapper namespace="com.scmaster.mapper.BabyBookMapper">
	
	<insert id="insertBabyBook" parameterType="BabyBook">
		INSERT INTO BABYBOOK(
			BOARDNUM,
			USERNO,
			CONTENT, 
			REGDATE,
			ORIGINALFILE, 
			SAVEDFILE)
		VALUES(
			BABYBOOK_SEQ.NEXTVAL,
			#{userNo},
			#{content},
			SYSDATE,
			#{originalfile},
			#{savedfile}
		)
	</insert>
	
	<select id="selectList" resultType="BabyBook">
		SELECT BOARDNUM,
			USERNO, 
			CONTENT, 
			REGDATE,
			ORIGINALFILE, 
			SAVEDFILE FROM BABYBOOK
	</select>
	
	<select id="selectOne" parameterType="int" resultType="BabyBook">
		SELECT BOARDNUM,
			USERNO,
			CONTENT, 
			REGDATE,
			ORIGINALFILE, 
			SAVEDFILE FROM BABYBOOK 
			WHERE BOARDNUM = #{boardnum}
	
	</select>
	<!-- selectBabyBookListLoginNo  -->
	<select id="selectBabyBookListLoginNo" parameterType="int" resultType="BabyBook">
		SELECT BOARDNUM,
			USERNO,
			BABYNO,
			TITLE, 
			CONTENT, 
			REGDATE,
			ORIGINALFILE, 
			SAVEDFILE FROM BABYBOOK
			WHERE USERNO = #{userNo}
	</select>
	
	
</mapper>