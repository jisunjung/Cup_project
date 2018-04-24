package com.teafunnycup.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.teafunnycup.dao.BoardDAO;

public class GoodPointAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "qnaone.jsp";
		
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		
		BoardDAO bDao = new BoardDAO();
		
		int gpoint;
		gpoint = bDao.boardGpoint(bno);
		
		request.setAttribute("gpoint", gpoint);
		
		JSONObject jObj = new JSONObject();
		jObj.put("gpoint", gpoint);
		

		response.setContentType("application/x-json); charset=UTF-8");
		response.getWriter().println(jObj);
		

		return null;
		
		
		
		/*System.out.println("좋아요 AJAX !!!!!!--------->" + gpoint);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		return forward;*/

		
	}

}
