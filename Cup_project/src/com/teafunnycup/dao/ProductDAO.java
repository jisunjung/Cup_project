package com.teafunnycup.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.teafunnycup.common.DBManager;
import com.teafunnycup.dto.ProductDTO;
import com.teafunnycup.mybatis.SqlMapConfig;


public class ProductDAO {
	
	/*Connection conn = null;
	PreparedStatement pstmt= null;
	ResultSet rs = null;
	int result;*/
	
	// MyBatis 세팅값 호출
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
		
	// mapper에 접근하기 위한 SqlSession
	SqlSession sqlSession;
	
	private static ProductDAO instance = new ProductDAO();
	public static ProductDAO getInstance() {
		return instance;
	}
	
	// 신상품 조회
	public List<ProductDTO> listNewProduct(){
		List<ProductDTO> list_new = new ArrayList<>();
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			
			list_new = sqlSession.selectList("newpdtview");
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return list_new;
	}
	
	// 인기상품 조회
		public List<ProductDTO> listBestProduct(){
			List<ProductDTO> list_best = new ArrayList<>();
			sqlSession = sqlSessionFactory.openSession();
			try {
				list_best = sqlSession.selectList("bestpdtview");
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return list_best;
		}
}
