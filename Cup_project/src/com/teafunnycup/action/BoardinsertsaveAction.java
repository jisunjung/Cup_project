package com.teafunnycup.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teafunnycup.dao.BoardDAO;

public class BoardinsertsaveAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "qna.bizpoll";
		
		// form 태그 안에 있는 input값의 Name 속성으로 가져옴.
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		System.out.println(title + ", " + writer + ", " + content);
		
		BoardDAO bDAO = BoardDAO.getInstance();
		int result = bDAO.boardInsert(title, writer, content);
		// 게시글을 실제로 등록하고, 게시글 등록 후 게시글 목록 페이지로 이동
		if(result > 0) {
			System.out.println("게시글 등록 성공");
		} else {
			System.out.println("게시글 등록 실패");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
				
		return forward;
	}
	

}
