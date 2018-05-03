package com.teafunnycup.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teafunnycup.dao.BoardDAO;
import com.teafunnycup.dto.BoardDTO;
import com.teafunnycup.dto.CriteriaDTO;

public class BoardLineUpNoAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "qna.jsp";
		
		String lineup_code = request.getParameter("lineup_value");
		
		if(lineup_code.equals("l_no")) {
			System.out.println("게시판 번호순으로 정렬");
		} else if(lineup_code.equals("l_contents")) {
			System.out.println("게시판 제목순으로 정렬");
		} else if(lineup_code.equals("l_name")) {
			System.out.println("게시판 작성자순으로 정렬");
		} else if(lineup_code.equals("l_date")) {
			System.out.println("게시판 날짜순으로 정렬");
		} else if(lineup_code.equals("l_view")) {
			System.out.println("게시판 조회순으로 정렬");
		} else if(lineup_code.equals("l_good")) {
			System.out.println("게시판 좋아요순으로 정렬");
		}
		
		// criDto 계산하기
		CriteriaDTO criDto = new CriteriaDTO();
		int page = 1;		// 최초의 페이지
		if(request.getParameter("page") != null) {
		page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("페이지 번호 : " + page);
		criDto.setPage(page);
	
		// 정렬된 게시판 리스트 출력
		criDto.setLineup_code(lineup_code); 
		BoardDAO bDao = BoardDAO.getInstance();	
		
		List<BoardDTO> boardlist = bDao.lineup(criDto);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
				
		return forward;
	}

}
