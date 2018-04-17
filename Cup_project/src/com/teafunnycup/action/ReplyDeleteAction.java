package com.teafunnycup.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.teafunnycup.dao.ReplyDAO;


// 게시판 댓글을 삭제하는 페이지
public class ReplyDeleteAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Integer rno = Integer.parseInt(request.getParameter("rno"));
		System.out.println("rno = " + rno);
		
		ReplyDAO rDao = ReplyDAO.getInstance();
		rDao.replyDelete(rno);
		
		
		//JSON방식 
		JSONObject jObj = new JSONObject();
		response.setContentType("application/x-json); charset=UTF-8");
		response.getWriter().println(jObj);
		
		return null;
	}
	
}
