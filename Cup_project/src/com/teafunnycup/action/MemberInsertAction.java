package com.teafunnycup.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teafunnycup.dao.MemberDAO;
import com.teafunnycup.dto.MemberDTO;

public class MemberInsertAction implements Action{
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "index.bizpoll";
		
		// name값으로 가져옵니다 ""
		String mid = request.getParameter("input_id");
		String mpw = request.getParameter("input_pw");
		String mname = request.getParameter("input_name");
		String mbirth = request.getParameter("input_birth");
		String memail1 = request.getParameter("input_email1");
		String memail2 = request.getParameter("input_email2");
		String memail = memail1 + "@" + memail2;
		String mphone = request.getParameter("input_phone");
		String madd = request.getParameter("input_add");
		
		
		System.out.println(mid + ", " + mpw + ", " + mname + ", " + mphone + ", " + madd + ", " + memail + ", " + mbirth);
		
		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO mDto = new MemberDTO(mid, mpw, mname, mphone, madd, memail, mbirth);
		int result = mDao.memInsert(mDto);
		
		if(result > 0){ //회원정보 등록
			url = "index.bizpoll";
			System.out.println();
		} else {
			url = "member.bizpoll";
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
				
		return forward;
	}

	
}
