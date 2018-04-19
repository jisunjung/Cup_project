package com.teafunnycup.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teafunnycup.dao.BoardDAO;
import com.teafunnycup.dao.QnaDAO;
import com.teafunnycup.dao.ReplyDAO;
import com.teafunnycup.dto.BoardDTO;
import com.teafunnycup.dto.CriteriaDTO;
import com.teafunnycup.dto.PageMakerDTO;
import com.teafunnycup.dto.QnaDTO;

public class QnaAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "qna.jsp";
		
		//QnaDAO qDao = QnaDAO.getInstance();
		//List<QnaDTO> qna_list = qDao.list_Qna();
		
		//request.setAttribute("qna", qna_list);
		
		// 게시판 페이지
		CriteriaDTO criDto = new CriteriaDTO();
		int page = 1;		// 최초의 페이지
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("페이지 번호 : " + page);
		criDto.setPage(page);
		
		// 객체 생성 DB이용
		BoardDAO bDao = BoardDAO.getInstance();		//BoardDAO bDao = new BoardDAO();
		List<BoardDTO> boardlist = bDao.listAll(criDto);	// = list (게시글 목록)
		
/*		// 상세 게시글 댓글수 카운트
		int re_count;
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		ReplyDAO rDao = ReplyDAO.getInstance();
		re_count = rDao.replyCount(bno);
		System.out.println("re_count : " + re_count);
		request.setAttribute("re_count", re_count);*/
		
		// 값 넘겨주기
		request.setAttribute("boardlist", boardlist);
		
		PageMakerDTO pageMaker = new PageMakerDTO();
		pageMaker.setCriDto(criDto);
		int result = bDao.totalCount(criDto);
		//pageMaker.setTotalCount(bDao.totalCount(criDto));
		pageMaker.setTotalCount(result);
		
		request.setAttribute("pageMaker",  pageMaker);
		
		// 오늘 날짜를 보내준다.
		Date today = new Date();
		request.setAttribute("today", today);
		
		// title 옆에 댓글 수 표시해주기
		//ReplyDAO rDao = ReplyDAO.getInstance();
		
		
		
		
				
		//System.out.println("게시글 출력 페이지");
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		
		
		
		return forward;
	}

	
}
