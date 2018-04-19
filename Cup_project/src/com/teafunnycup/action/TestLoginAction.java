package com.teafunnycup.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.teafunnycup.dao.MemberDAO;
import com.teafunnycup.dto.MemberDTO;

public class TestLoginAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		int flag = 0;
		
		System.out.println(id + ", " + pw);
		
		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO mDto = mDao.loginCheck(id, pw);
		
		if(mDto != null) {
			// 로그인 성공
			System.out.println("로그인 성공");
			
			 HttpSession session = request.getSession();
			 
			 session.removeAttribute("loginUser");
			 session.setAttribute("loginUser", mDto);
			 flag = 1;
		} else {
			//  로그인 실패
			System.out.println("로그인 실패");
			flag = 0;
		}
		
		JSONObject jObj = new JSONObject();
		jObj.put("flag", flag);
		
		response.setContentType("application/x-json); charset=UTF-8");
		response.getWriter().println(jObj);
		
		
		return null;
	}
	

}
