package com.teafunnycup.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teafunnycup.dao.BoardDAO;
import com.teafunnycup.dto.BoardDTO;

public class BoardDeleteAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "qna.jsp";
		
		//String bno = request.getParameter("bno");
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		System.out.println(bno + ", " + title + ", " + writer);
		
		System.out.println("삭제요청!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.boardDelete(bno);
		
		if(result > 0) {
			System.out.println("게시글 삭제 성공");
			url = "qna.bizpoll";
		} else {
			System.out.println("게시글 삭제 실패");
			url = "index.bizpoll";
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
				
		return forward;
		
	}
}
