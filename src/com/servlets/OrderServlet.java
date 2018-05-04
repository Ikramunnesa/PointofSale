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

import com.bean.Order;
import com.dal.OrderGateway;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("/POS/orderForm.jsp");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Date date=null;
		 try {
		 date=new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("orderDate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		Order order=new Order();
		order.setCustomerName(request.getParameter("customerName"));
		order.setCustomerContact(request.getParameter("customerContact"));
		order.setOrderDate(date);
		order.setPaidAmount(Float.parseFloat(request.getParameter("paidAmount")));
		order.setProductBrand(request.getParameter(request.getParameter("productBrand")));
		order.setProductModel(request.getParameter("productModel"));
		order.setProductName(request.getParameter("productName"));
		order.setToalQty(Integer.parseInt(request.getParameter("totalQty")));
		OrderGateway orderGateway=new OrderGateway();
		int i=orderGateway.saveOrder(order);
		if (i>0) {
			response.sendRedirect("/POS/showOrder.jsp");
		}else {
			response.sendRedirect("/POS/orderForm.jsp");
			
		}
	}

}
