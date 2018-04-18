package com.teafunnycup.dao;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

import com.teafunnycup.dto.BoardDTO;
import com.teafunnycup.dto.CriteriaDTO;
import com.teafunnycup.mybatis.SqlMapConfig;

public class BoardDAO {
	
		SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
		SqlSession sqlSession;
		
		private static BoardDAO instance = new BoardDAO();
		public static BoardDAO getInstance() {
			return instance;
		}
		int result = 0;
		
		// 게시판 목록
		public List<BoardDTO> listAll(CriteriaDTO criDto) {
			
			sqlSession = sqlSessionFactory.openSession();
			List<BoardDTO> list = new ArrayList<>();
			
			try {
				list = sqlSession.selectList("listCriteria", criDto);
				
				for (BoardDTO boardDTO : list) {
					System.out.print(boardDTO.getBno() + ", ");
					System.out.print(boardDTO.getTitle() + ", ");
					System.out.print(boardDTO.getContent() + ", ");
					System.out.print(boardDTO.getWriter() + ", ");
					System.out.print(boardDTO.getRegdate() + ", ");
					System.out.print(boardDTO.getViewcnt());
					System.out.println();
					
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return list;
		}
		
		public int totalCount(CriteriaDTO criDto) {
			sqlSession = sqlSessionFactory.openSession();
			
			try {
				result = sqlSession.selectOne("countPaging", criDto);
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return result;
		}
		
		// 게시글 등록
		public int boardInsert(String title, String writer, String content) {
			
			sqlSession = sqlSessionFactory.openSession();
			
			try {
				BoardDTO bDto = new BoardDTO(title, content, writer);
				result = sqlSession.insert("boardinsert",bDto);
				sqlSession.commit();
				System.out.println("result = " + result);
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			
			return result;
		}
		
		// 게시글 상세 뷰 
		public BoardDTO boardDetailView(Integer bno) {
			
			BoardDTO bDto = null;
			sqlSession = sqlSessionFactory.openSession();
			
			try {
				// 여러건 출력 : selectList = LIST Type
				// 단건 출력 : selectOne = DTO Type
				bDto = sqlSession.selectOne("boarddetailview", bno);
				
				System.out.print(bDto.getBno() + ", ");
				System.out.print(bDto.getTitle() + ", ");
				System.out.print(bDto.getContent() + ", ");
				System.out.print(bDto.getWriter() + ", ");
				System.out.print(bDto.getRegdate() + ", ");
				System.out.print(bDto.getViewcnt());
				System.out.println();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return bDto;
		}
		
		// 게시글 수정
		public int boardUpdate(BoardDTO bDto) {
			
			sqlSession = sqlSessionFactory.openSession();
			
			try {
				result = sqlSession.update("boardupdate",bDto);
				sqlSession.commit();
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			
			return result;
		}
		
		// 게시글 삭제
		public int boardDelete(Integer bno) {
			
			sqlSession = sqlSessionFactory.openSession();
			
			try {
				result = sqlSession.delete("boarddelete", bno);
				sqlSession.commit();
				
			} catch(Exception e) {
				
			} finally {
				sqlSession.close();
			}
			return result;
		}
		
		// 게시글 번호 넘겨주기
		/*public Integer boardNumber(String bno) {
			
			
			return bno;
		}
		*/
		// 페이지 totalCount
		
		public void boardViewCnt(Integer bno) {
			sqlSession = sqlSessionFactory.openSession();
			
			try {
				sqlSession.update("boardViewCnt", bno);
				sqlSession.commit();
				
				if(result > 0) {
					System.out.println("count 1 증가 성공");
				} else {
					System.out.println("count 1 증가 실패");
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
		}
		public List<BoardDTO> boardSearch(CriteriaDTO criDto){
			sqlSession = sqlSessionFactory.openSession();
			List<BoardDTO> list = null;
			
			String flag = criDto.getFlag();
			
			try {
				System.out.println("Keyword ===>" + criDto.getKeyword());
				System.out.println("Flag ===>" + flag);
				
				if(flag.equals("1")) {
					
				}
				
				list = sqlSession.selectList("boardSearch", criDto);
				
				for (BoardDTO boardDTO : list) {
					System.out.print(boardDTO.getBno() + ", ");
					System.out.print(boardDTO.getTitle() + ", ");
					System.out.print(boardDTO.getContent() + ", ");
					System.out.print(boardDTO.getWriter() + ", ");
					System.out.print(boardDTO.getRegdate() + ", ");
					System.out.print(boardDTO.getViewcnt() + ", ");
					System.out.println();
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return list;
		}
		public String boardSearchSelectBox(CriteriaDTO criDto){
			
			String flag = criDto.getFlag();
			String selflag = null;
			
			try {
				if(flag.equals("1")) {
					selflag = "전체";
				} else if(flag.equals("2")) {
					selflag = "제목";
				} else if(flag.equals("3")) {
					selflag = "내용";
				} else if(flag.equals("4")) {
					selflag = "제목+내용";
				} else if(flag.equals("5")) {
					selflag = "작성자";
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return selflag;
		}
	
}

