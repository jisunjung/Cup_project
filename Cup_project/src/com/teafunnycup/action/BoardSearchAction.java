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
		
		
		CriteriaDTO criDto = new CriteriaDTO();
		int page = 1;		// 최초의 페이지
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("페이지 번호 : " + page);
		criDto.setPage(page);
		
		// 검색된 게시판 리스트 출력
		BoardDAO bDao = BoardDAO.getInstance();		//BoardDAO bDao = new BoardDAO();
		String keyword = request.getParameter("search_keyword");
		System.out.println("검색 키워드 : " + keyword);
		// criDto에 keyword값 추가
		criDto.setKeyword(keyword);
		
		List<BoardDTO> boardlist = bDao.boardSearch(criDto);
		request.setAttribute("boardlist", boardlist); 
		
		PageMakerDTO pageMaker = new PageMakerDTO();
		pageMaker.setCriDto(criDto);
		int result = bDao.totalCount(criDto);
		pageMaker.setTotalCount(result);
		
		request.setAttribute("pageMaker",  pageMaker);
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
				
		return forward;
	}

}
