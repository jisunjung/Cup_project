package com.teafunnycup.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teafunnycup.dao.BoardDAO;
import com.teafunnycup.dao.ReplyDAO;
import com.teafunnycup.dto.BoardDTO;

public class BoardDeleteAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;
		
		//String bno = request.getParameter("bno");
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		//String writer = request.getParameter("writer");
		//String title = request.getParameter("title");
		//System.out.println(bno + ", " + title + ", " + writer);
		
		System.out.println("******************************NO. "+bno + "삭제요청!!! : BoardDeleteAction");
		
		// *** 글이 지워지기 전에 해당 글 번호의 리플 먼저 삭제
		// 1. 잔업 : 해당 게시글의 리플 삭제
		ReplyDAO rDao = ReplyDAO.getInstance();
		int rd_result = rDao.replyDeleteWithBoard(bno);
		
		// 본래 실행 명령
		// 2.명령 : 게시글 삭제 실행
		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.boardDelete(bno);
		
		
		
		if(result > 0) {
			System.out.println("게시글 삭제 성공");
			url = "qna.bizpoll";
		} else {
			System.out.println("게시글 삭제 실패");
			url = "index.bizpoll";
		}
		
		if(rd_result > 0) {
			System.out.println("Action단에서 리플 삭제 확인 완료 : " + bno);
		} else {
			System.out.println("Action단에서 리플 삭제 확인 실패 : " + bno);
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
				
		return forward;
		
	}
}
