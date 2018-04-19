package com.teafunnycup.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teafunnycup.dao.BoardDAO;
import com.teafunnycup.dto.BoardDTO;
import com.teafunnycup.dto.CriteriaDTO;
import com.teafunnycup.dto.PageMakerDTO;

public class BoardSearchAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "qna.jsp";
		
		String flag = request.getParameter("selsearch");
		
		if(flag.equals("1")) {
			System.out.println("전체 검색 Start");
		} else if(flag.equals("2")) {
			System.out.println("제목 검색 Start");
		} else if(flag.equals("3")) {
			System.out.println("내용 검색 Start");
		} else if(flag.equals("4")) {
			System.out.println("제목+내용 검색 Start");
		} else if(flag.equals("5")) {
			System.out.println("작성자 검색 Start");
		}
		
		// criDto 계산하기
		CriteriaDTO criDto = new CriteriaDTO();
		int page = 1;		// 최초의 페이지
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("페이지 번호 : " + page);
		criDto.setPage(page);
		
		// 검색된 게시판 리스트 출력
		
		criDto.setFlag(flag);		// criDto에 검색조건 입력
		BoardDAO bDao = BoardDAO.getInstance();		//BoardDAO bDao = new BoardDAO();
		String keyword = request.getParameter("search_keyword");
		System.out.println("검색 키워드 : " + keyword);
		// criDto에 keyword값 추가
		criDto.setKeyword(keyword);
		request.setAttribute("keyword", keyword);
		List<BoardDTO> boardlist = bDao.boardSearch(criDto);
		
		String selflag = bDao.boardSearchSelectBox(criDto);
		
		
		// 검색된 키워드에 맞는 게시판 리스트 페이지
		
		PageMakerDTO pageMaker = new PageMakerDTO();
		pageMaker.setCriDto(criDto);
		int scountpage = bDao.boardSPaging(criDto);
		pageMaker.setTotalCount(scountpage);
		
		request.setAttribute("pageMaker",  pageMaker);
		

		
		boolean listcounter;
		

		if(boardlist != null) {
			listcounter = true;
			System.out.println("listcounter======================================"+listcounter);
		} else {
			listcounter = false;
			System.out.println("listcounter======================================"+listcounter);
		}
		
		// 검색된 리스트
		request.setAttribute("boardlist", boardlist); 
		// 검색분류
		request.setAttribute("selflag", selflag);
		//
		request.setAttribute("listcounter", listcounter);
		
		
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
				
		return forward;
	}

}
