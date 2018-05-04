package com.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Sales;
import com.dal.SalesGateway;

/**
 * Servlet implementation class SaleServlet
 */
@WebServlet("/sale")
public class SaleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("/POS/salesForm.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Date date=null;
		 try {
		 date=new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("trunsactionDate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		Sales s=new Sales();
		s.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
		s.setPaidAmount(Float.parseFloat(request.getParameter("paidAmount")));
		s.setTotalQty(Integer.parseInt(request.getParameter("totalQty")));
		s.setTrunsactionDate(date);
		SalesGateway salesGateway=new SalesGateway();
		int i=salesGateway.saveSales(s);
		if(i>0)
			response.sendRedirect("/POS/index.jsp");
			//response.sendRedirect("/POS/showSales.jsp?customerId="+s.getCustomerId()+"&date="+java.sql.Date.parse(date.toLocaleString()));
		else
			response.sendRedirect("/POS/salesForm.jsp");
	}

}
