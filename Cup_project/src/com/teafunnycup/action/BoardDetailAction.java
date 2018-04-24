package com.teafunnycup.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teafunnycup.dao.BoardDAO;
import com.teafunnycup.dao.ReplyDAO;
import com.teafunnycup.dto.BoardDTO;
import com.teafunnycup.dto.ReplyDTO;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "qnaone.jsp";	// 게시글 상세페이지 출력
		
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("게시글 번호 = " + bno);
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		// ---조회수 1 증가---
		// ***조회수 증가 방지*** (1. IP, 2. Cookie, 3. Session-server)
		// * Session을 이용한 방법
		HttpSession session = request.getSession();
		bDao.boardViewCnt(bno, session);
		
		
		// 상세 게시글 출력
		BoardDTO bDto = bDao.boardDetailView(bno);
		request.setAttribute("boardview", bDto);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		return forward;
		
	}
}
