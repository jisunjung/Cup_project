package com.teafunnycup.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teafunnycup.dao.ProductDAO;
import com.teafunnycup.dto.ProductDTO;

public class IndexAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "index.jsp";
		//System.out.println("index........................");
		/*if(session.getAttribute("loginUser") != null) {
			MemberDTO mDto = (MemberDTO)session.getAttribute("loginUser");
			System.out.println("===>);
			System.out.println(mDto.getMid());
			
		}*/
		
		// 상품 상세페이지
		//ProductDAO pDao = new ProductDAO();
		ProductDAO pDao = ProductDAO.getInstance();
		
		// 신상품
		List<ProductDTO> newProductList = pDao.listNewProduct(); 
		
		request.setAttribute("newProductList", newProductList);
		
		// 인기상품
		List<ProductDTO> bestProductList = pDao.listBestProduct();
		
		request.setAttribute("bestProductList", bestProductList);
		
		//System.out.println("forward 세팅 전");
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		//System.out.println("forward 세팅 후 return 시작 전");
		return forward;
	}
	
}
