package com.teafunnycup.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teafunnycup.dao.MemberDAO;
import com.teafunnycup.dto.MemberDTO;

public class BoardLoginChekeAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;
		
		
		
		//String mid = (String)Session.getAttribute("mid");
		HttpSession session = request.getSession();
		MemberDTO mDto = (MemberDTO) session.getAttribute("loginUser");
		/*System.out.println(result);*/
		
		//System.out.println(mDto.getMid() + "님의 글쓰기 요청");
		//session.setAttribute("code", 0);
		if(mDto != null) {
			url = "writeqna.bizpoll";
			session.setAttribute("code", 0);
		} else {
			url = "qna.bizpoll"; 
			session.setAttribute("code", 1); 
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
		
	}
	

}
