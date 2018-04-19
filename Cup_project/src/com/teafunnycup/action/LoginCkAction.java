package com.teafunnycup.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teafunnycup.dao.MemberDAO;
import com.teafunnycup.dto.MemberDTO;

public class LoginCkAction implements Action{

	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String url = null;
		
		int flag=0;
		
		String mid = request.getParameter("login_id");
		String mpw = request.getParameter("login_pw");
		System.out.println(mid + ", " + mpw);

		
		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO mDto = new MemberDTO(mid, mpw);
		mDto = mDao.sessionLogin(mDto);
		
		if(mDto.getMname() != null) {
			System.out.println("!!!!!로그인 성공!!!!!");
			System.out.println(mDto.getMid() + ", " + mDto.getMname());
			
			
			session.removeAttribute("loginUser"); // 세션 초기화 ( 혹시 모를 남아있는 값 제거)
			session.setAttribute("loginUser", mDto); // 세션에 값 담기
			url = "index.bizpoll";
			
			flag = 1;
		} else {
			System.out.println("!!!!!로그인 실패, 해당 아이디의 회원 찾을 수 없음!!!!!");
		}
		
		
		
		/*int flag = mDao.memLogin(mid,mpw);
		
		if(flag == 0) {
			url = "login.bizpoll";
			request.setAttribute("flag", flag);
		} else if(flag == 1) {
			//session 값 추가
			url = "index.bizpoll";
		}*/
		
		/*ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);*/
				
		return null;
		
	}
}
