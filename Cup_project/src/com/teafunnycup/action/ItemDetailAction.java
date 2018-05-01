package com.teafunnycup.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teafunnycup.dao.BoardDAO;
import com.teafunnycup.dao.ProductDAO;
import com.teafunnycup.dto.BoardDTO;
import com.teafunnycup.dto.ProductDTO;

public class ItemDetailAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "item_detail.jsp";
		
		String p_code = request.getParameter("p_code");
		System.out.println("!!!!!상품 코드::::: "+ p_code + " !!!!!");
		
		ProductDAO pDao = ProductDAO.getInstance();


		// 상품 상세페이지
		ProductDTO pDto = pDao.productDetailView(p_code);
		request.setAttribute("items", pDto);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
				
		return forward;
	}
	

}
