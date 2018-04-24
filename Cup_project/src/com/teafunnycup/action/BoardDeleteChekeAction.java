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
		
		String bno = request.getParameter("bno");
		//Integer bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("삭제를 요청한 게시글 번호 : "+bno);
		
		
		//int rno = Integer.parseInt(request.getParameter("rno"));
		//System.out.println("해당 게시글에 달리 댓글 번호 : " + rno);
		
		//int re_count = Integer.parseInt(request.getParameter("re_count"));
		//System.out.println("re_count : " + re_count);
		
		/*if(rno != null) {
			System.out.println("해당 게시글에 댓글이 존재해서 게시글을 삭제할 수 없습니다.");
			request.setAttribute("rno", rno);
		} else if(rno == null){
			System.out.println("댓글 없음 삭제 가능 게시글");
			request.setAttribute("bno", bno);
		}*/
		
	/*	if(re_count != 0) {
			System.out.println("해당 게시글에 댓글이 존재해서 게시글을 삭제할 수 없습니다.");
			request.setAttribute("re_count", re_count);
		} else if(re_count == 0){
			System.out.println("댓글 없음 삭제 가능 게시글");
			request.setAttribute("bno", bno);
		}
		*/
		
		
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
