package com.teafunnycup.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.teafunnycup.dao.BoardDAO;
import com.teafunnycup.dao.ReplyDAO;
import com.teafunnycup.dto.ReplyDTO;

public class ReplyAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Integer bno = Integer.parseInt(request.getParameter("re_bno"));
		String content = request.getParameter("re_input");
		String writer = request.getParameter("rn_input");
		
		System.out.println(bno + "," + content + ", " + writer );

		
		
		ReplyDAO rDao = ReplyDAO.getInstance();
		ReplyDTO rDto = new ReplyDTO(content, writer, bno);
		int result = rDao.replyInsert(rDto);
		
		if(result > 0) {
			System.out.println("!!!!!댓글 등록 성공!!!!!");
		} else {
			System.out.println("!!!!!댓글 등록 실패!!!!!");
		}
		
		JSONObject jObj = new JSONObject();
		//jObj.put("result", result);
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().println(jObj);
		
		System.out.println("AJAX TEST!!!!!! Reply");

		return null;
		
	/*String url = "boarddetail.bizpoll?bno=" + bno;
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
				
		return forward;*/
	}
	

}
