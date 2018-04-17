package com.teafunnycup.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teafunnycup.dao.BoardDAO;
import com.teafunnycup.dto.BoardDTO;

public class BoardDeleteChekeAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "board_delete_ck.jsp";
		
		System.out.println("test===========================================================");
		
		//String bno = request.getParameter("bno");
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("삭제를 요청한 게시글 번호 : "+bno);
		
		//BoardDAO bDao = BoardDAO.getInstance();
		//String dbno = bDao.boardNumber(bno);
		
		// 게시글의 번호 출력
		//System.out.println(dbno + "번의 글 삭제 요청");
		
		request.setAttribute("bno", bno);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
				
		return forward;
		
	}

}
