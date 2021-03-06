package com.teafunnycup.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.teafunnycup.dto.BoardDTO;
import com.teafunnycup.dto.ReplyDTO;
import com.teafunnycup.mybatis.SqlMapConfig;

public class ReplyDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	SqlSession sqlSession;
	
	private ReplyDAO() {
		
	}
	
	private static ReplyDAO instance = new ReplyDAO();
	public static ReplyDAO getInstance() {
		return instance;
	}
	int result = 0;
	
	public List<ReplyDTO> replySelect(Integer bno) {
		sqlSession = sqlSessionFactory.openSession();
		List<ReplyDTO> list = null;
		
		try {
			list = sqlSession.selectList("replyAll", bno);
	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	public int replyCount(Integer bno) {
		sqlSession = sqlSessionFactory.openSession();
		
		int re_count = 0;
		
		try {
			System.out.println("DAO에서 bno=???????" + bno);
			re_count = sqlSession.selectOne("replycount", bno);
			System.out.println("re_count ::::::::::::::::::::" + re_count);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return re_count;
	}

	public int replyInsert(ReplyDTO rDto) {
		sqlSession = sqlSessionFactory.openSession();
		System.out.println("댓글등록!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		try {
			//ReplyDTO rDto = new ReplyDTO(content, writer, bno);
			result = sqlSession.insert("replyinsert", rDto);
			sqlSession.commit();
			System.out.println("result = " + result);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	public void replyDelete(Integer rno) {
		sqlSession = sqlSessionFactory.openSession();
		try {
			result = sqlSession.delete("replydelete", rno);
			sqlSession.commit();
			
			if(result >0) {
				System.out.println("댓글 삭제 성공");
			} else {
				System.out.println("댓글 삭제 실패");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	} 
	
	// 게시글이 삭제되었을 때의 댓글 삭제 (연쇄삭제)
	// 해당 bno에 해당하는 댓글을 삭제할 것이므로 위의 delete와 다름
	public int replyDeleteWithBoard(Integer bno) {
		int rd_result = 0;
		
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			rd_result = sqlSession.delete("bnoreplydelete", bno);
			sqlSession.commit();
			
			if(rd_result > 0) {
				System.out.println(bno + "번의 게시글 삭제와 동시에 리플도 함께 삭제 성공");
			} else {
				System.out.println(bno + "번의 게시글이 삭제되면서 실행한 리플 삭제 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return rd_result;
	}
}
