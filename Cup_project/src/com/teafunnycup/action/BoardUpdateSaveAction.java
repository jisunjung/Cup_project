package com.teafunnycup.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teafunnycup.dao.BoardDAO;
import com.teafunnycup.dto.BoardDTO;

public class BoardUpdateSaveAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;
		
		
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		System.out.println(bno + ", " + title + ", " + content + ", " + writer);
		
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = new BoardDTO(bno, title, content, writer);
		int result = bDao.boardUpdate(bDto);
		// 게시글을 실제로 등록하고, 게시글 등록 후 게시글 목록 페이지로 이동
		if(result > 0) {
			System.out.println("게시글 수정 성공");
			url = "qna.bizpoll";
		} else {
			System.out.println("게시글 수정 실패");
			url = "index.bizpoll";
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
				
		return forward;
	}
	
}
