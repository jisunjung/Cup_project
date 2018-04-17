package com.teafunnycup.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teafunnycup.dao.MemberDAO;
import com.teafunnycup.dto.MemberDTO;

public class IdOlapCkAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "id_olap_ck.jsp";
		
		String memberid = request.getParameter("memberid");
		System.out.println("ID = " + memberid);
		
		String mid = null;
		MemberDTO mDto = new MemberDTO(mid);
		MemberDAO mDao = MemberDAO.getInstance();
		
		int flag = mDao.memIdCheck(mid);
		
		/*if (flag == 0) {
			// 중복된 ID
		} else if(flag == 1) {
			// 사용가능한 ID
		}*/
		
		// flag가 0이면 중복, flag가 1이면 사용가능
		request.setAttribute("flag", flag);
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
				
		return forward;
	
	}

}
