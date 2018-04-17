package com.teafunnycup.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.teafunnycup.common.DBManager;
import com.teafunnycup.dto.MemberDTO;
import com.teafunnycup.mybatis.SqlMapConfig;

public class MemberDAO {
	
	///////////////MemberDTO mDto = new MemberDTO();
	/*Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int result, flag;
	*/
	
	// MyBatis 세팅값 호출
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
			
	// mapper에 접근하기 위한 SqlSession
	SqlSession sqlSession;
	
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	// ID 중복체크
	public int memIdCheck(String mid) {
		String result = null;
		int flag = 0;
		
		sqlSession = sqlSessionFactory.openSession();
		try {
			
			/*conn = DBManager.getConnection();
			String sql = "SELECT mid FROM member "
					+ "WHERE mid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberid);
			
			rs = pstmt.executeQuery();
			
			String mid = null;
			while(rs.next()) {
				mid = rs.getString("mid");
			}*/
			
			result = sqlSession.selectOne("memIdCheck", mid);
					//("memIdCheck",mDto);
			//sqlSession.commit();
			
			
			if(result != null) {
				System.out.println("중복된 ID 입니다.");
				flag = 0;
			} else {
				System.out.println("사용가능한 ID 입니다.");
				flag = 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return flag;
	}
	
	// 회원 등록
	public int memInsert(MemberDTO mDto) {
		int result = 0;
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			/*conn = DBManager.getConnection();
			String sql = "INSERT INTO member (mid, mpw, mname, mphone, madd, memail, mbirth) "
					   + "VALUES(?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mDto.getMid());
			pstmt.setString(2, mDto.getMpw());
			pstmt.setString(3, mDto.getMname());
			pstmt.setString(4, mDto.getMphone());
			pstmt.setString(5, mDto.getMadd());
			pstmt.setString(6, mDto.getMemail());
			pstmt.setString(7, mDto.getMbirth());
			
			
			result = pstmt.executeUpdate();*/
			
			result = sqlSession.insert("memInsert", mDto);
			sqlSession.commit();
						
			if(result > 0) {
				System.out.println("회원정보 등록 성공");
			} else {
				System.out.println("회원정보 등록 실패");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			
		} finally {
			/*DBManager.close(conn, pstmt);*/
			sqlSession.close();
		}
		
		
		return result;
	}
	
	// 로그인 ID, PW 등록된 회원인지 체크
	public int memLogin(MemberDTO mDto) {
		
		int flag = 0;	
		List<MemberDTO> list= null;
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			/*conn = DBManager.getConnection();
			String sql = "SELECT mid FROM member "
					+ "WHERE mid = ? AND mpw = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			rs = pstmt.executeQuery();*/
			
			list = sqlSession.selectList("memLogin",mDto);
			
			if(list == null) {
				System.out.println("ID나 PW가 없는 경우");
				flag = 0;
			} else {
				System.out.println("로그인 OK");
				flag = 1;
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return flag;
	}
	
	// session : 로그아웃
	public MemberDTO sessionLogin(MemberDTO mDto) {
		
		List<MemberDTO> list= null;
		sqlSession = sqlSessionFactory.openSession();
		// MemberDTO mDto = null;
		
			try {
			  /*conn = DBManager.getConnection();
				String sql = "SELECT * FROM member "
						+ "WHERE mid = ? AND mpw = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				pstmt.setString(2, mpw);
				rs = pstmt.executeQuery();
				
				
				while(rs.next()) {

					mid = rs.getString("mid");
					mpw = rs.getString("mpw");
					String mname = rs.getString("mname");
					String mphone = rs.getString("mphone");
					String madd = rs.getString("madd");
					String memail = rs.getString("memail");
					String mbirth = rs.getString("mbirth");
					Date regdate = rs.getDate("regdate");
					
					mDto = new MemberDTO(mid, mpw, mname, mphone, madd, memail, mbirth, regdate);
				}*/
				
				list =sqlSession.selectList("sessionLogin",mDto);
				
			} catch(Exception e) {
				e.printStackTrace();
		
			} finally {
				sqlSession.close();
			}
		return mDto;
	}
	
}
