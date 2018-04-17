package com.teafunnycup.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.teafunnycup.dao.MemberDAO;
import com.teafunnycup.dto.MemberDTO;

public class LoginAjaxAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String mid = request.getParameter("id");
		System.out.println("ID = " + mid);
		
		String mpw = request.getParameter("pw");
		System.out.println("PW = " + mpw);
		
		
		if(mid != null && mpw != null) {
				MemberDAO mDao = MemberDAO.getInstance();
				MemberDTO mDto = new MemberDTO(mid, mpw);
				int flag = mDao.memLogin(mDto);
				System.out.println("flag = "+ flag);
				
				JSONObject jObj = new JSONObject();
				jObj.put("flag", flag);
				jObj.put("id", mid);
				jObj.put("pw", mpw);
				
				response.setContentType("application/x-json); charset=UTF-8");
				response.getWriter().println(jObj);
				}
	
		return null;
	}
}

