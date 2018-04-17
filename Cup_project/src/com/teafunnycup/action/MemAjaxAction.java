package com.teafunnycup.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.teafunnycup.dao.MemberDAO;
import com.teafunnycup.dto.MemberDTO;

public class MemAjaxAction implements Action {
	
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String mid = request.getParameter("id");
		System.out.println("ID = " + mid);
		
		if(mid != null) {
			if(mid.trim().equals("") == false) {
				MemberDAO mDao = MemberDAO.getInstance();
				/*MemberDTO mDto = new MemberDTO(mid);*/
				int flag = mDao.memIdCheck(mid);
				System.out.println("flag = " + flag);
				
				JSONObject jObj = new JSONObject();
				jObj.put("flag", flag);
				jObj.put("id", mid);
				
				response.setContentType("application/x-json); charset=UTF-8");
				response.getWriter().println(jObj);
				
			}
		}
		
		return null;
	}
}
