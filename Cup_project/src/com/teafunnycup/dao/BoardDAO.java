package com.teafunnycup.dao;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

import com.sun.corba.se.pept.transport.EventHandler;
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
			
			String lineup_code = criDto.getLineup_code();
			System.out.println(lineup_code);
			
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
		public int boardInsert(BoardDTO bDto) {
			
			sqlSession = sqlSessionFactory.openSession();
			
			try {
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
		// 뷰 카운트
		
		public void boardViewCnt(Integer bno, HttpSession countSession) {
			sqlSession = sqlSessionFactory.openSession();
			
			try {
				
				long update_time = 0;
				
				
				// 조회수를 증가할 때 생기는 'read_time_게시글번호'가 없으면
				// 현재 처음 조회수를 1증가하는 경우임
				if(countSession.getAttribute("read_time_" + bno) != null) {
					update_time = (long)countSession.getAttribute("read_time_"+bno);
				}
				
				// 현재시간을 담는다
				long current_time = System.currentTimeMillis();
				
				
				
				/* 5초
				if(current_time - update_time > 5 * 1000) {*/
				/* 24시간 ( 하루에 한번만 증가)
				if(current_time - update_time > 24 * 60 * 60 * 1000) {
				현재시간과 조회수 1증가 한 시간을 비교해서 24시간(1일)이 지났으면 조회수 1 증가 {*/
				if(current_time - update_time > 24 * 60 * 60 * 1000) {
					result = sqlSession.update("boardViewCnt", bno);
					sqlSession.commit();
					
					// 조회수 1증가한 시간을 session에 담는다
					countSession.setAttribute("read_time_"+bno, current_time);
				}

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
		
		// 좋아요♥ 카운트
		public int boardGpoint(Integer bno) {
			sqlSession = sqlSessionFactory.openSession();
			try {
				result = sqlSession.update("boardGoodCnt",bno);
				sqlSession.commit();
				
				if(result > 0) {
					System.out.println("♥♥♥좋아요♥♥♥ 포인트 1 증가 성공");
				} else {
					System.out.println("ㅠㅠ좋아요ㅠㅠ 포인트 증가 실패");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			} return result;
		}
		
		public List<BoardDTO> boardSearch(CriteriaDTO criDto){
			sqlSession = sqlSessionFactory.openSession();
			List<BoardDTO> list = null;
			
			String flag = criDto.getFlag();
			
			try {
				System.out.println("Keyword ===>" + criDto.getKeyword());
				System.out.println("Flag ===>" + flag);
				
				/*if(flag.equals("1")) {
					
				}*/
				
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
		// 검색 게시판 페이지
		public int boardSPaging(CriteriaDTO criDto) {
			sqlSession = sqlSessionFactory.openSession();
			
			try {
				result = sqlSession.selectOne("scountPaging", criDto);
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return result;
		}
		
		// 파일 다운로드
		public String getFileName(Integer bno) {
			
			String result = " ";
			sqlSession = sqlSessionFactory.openSession();
			
			try {
				
				result = sqlSession.selectOne("getFileName", bno);
		
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(sqlSession != null) sqlSession.close();
			}
			return result;
		}
		
		// 파일 다운로드 횟수 1 증가
		public int downCount(Integer bno) {
			int result = 0;
			sqlSession = sqlSessionFactory.openSession();
			
			try {
				result = sqlSession.update("downCount",bno);
				sqlSession.commit();
				
				if(result > 0) {
					System.out.println("다운로드 횟수 1 증가 성공");
				} else {
					System.out.println("다운로드 횟수 증가 실패");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			} return result;
		
		}
		
		// 답변
		public void updateStep(int ref, int re_step) {
			sqlSession = sqlSessionFactory.openSession();
			
			try {
				BoardDTO bDto = new BoardDTO();
				bDto.setRef(ref);
				bDto.setRe_step(re_step);
				
				
				sqlSession.update("updateStep", bDto);
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (sqlSession != null) sqlSession.close();
			}
			
		}
		
		// 답변 등록
		public int answerInsert(BoardDTO bDto) {
			sqlSession = sqlSessionFactory.openSession();
			int result = 0;
			
			try {
				result = sqlSession.insert("answerInsert", bDto);
				sqlSession.commit();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (sqlSession != null) sqlSession.close();
			}
			return result;
		}
		
		// 게시판 정렬하기
		public List<BoardDTO> lineup(CriteriaDTO criDto){
			sqlSession = sqlSessionFactory.openSession();
			List<BoardDTO> list = null;
			
			String lineup_code = criDto.getLineup_code();
			System.out.println("정렬 코드 ===>" + lineup_code);
			
			try {
				list = sqlSession.selectList("boardlineup", criDto);
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return list;
		}
	} 

