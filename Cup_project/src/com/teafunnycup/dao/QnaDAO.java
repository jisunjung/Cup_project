package com.teafunnycup.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.teafunnycup.dto.ProductDTO;
import com.teafunnycup.dto.QnaDTO;
import com.teafunnycup.mybatis.SqlMapConfig;

public class QnaDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	SqlSession sqlSession;
	
	private static QnaDAO instance = new QnaDAO();
	public static QnaDAO getInstance() {
		return instance;
	}
	public List<QnaDTO> list_Qna(){
		List<QnaDTO> list_qna = new ArrayList<>();
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			
			list_qna = sqlSession.selectList("qna");
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return list_qna;
	}
}
