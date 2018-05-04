package com.dal;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.bean.Product;
import com.bean.Sales;
import com.bean.ViewSales;

public class SalesGateway {
	SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
	Session session;
	
	public int saveSales(Sales sales)
	{
		session=sessionFactory.openSession();
		session.beginTransaction();
		int rowEffected=(Integer)session.save(sales);
		session.getTransaction().commit();
		session.close();
		return rowEffected;
	}
	
	public List<Sales> getAllSales()
	{
		List<Sales> salesList=new ArrayList<Sales>();
		session=sessionFactory.openSession();
		session.beginTransaction();
		salesList=(ArrayList<Sales>)session.createCriteria(Sales.class).list();
		session.getTransaction().commit();
		session.close();
		return salesList;
	}
	public List<ViewSales> viewSales(/*int customerId,String date*/)
	{
		List<ViewSales> salesList=new ArrayList<ViewSales>();
		session=sessionFactory.openSession();
		session.beginTransaction();
		String hql = "SELECT customerId,name,contact,trunsactionDate,totalQty,paidAmount from viewsales ";//where customerId="+customerId;//+" and trunsactionDate='"+date+"'";
		//String hql="select s.salesId,c.name,c.contact,s.trunsactionDate,s.totalQty,s.paidAmount from customer as c\r\n" + 
			//	"inner join sales as s on c.customerId=s.customerId";
		/*Query query =*/ 
		salesList=(List<ViewSales>) session.createQuery(hql,ViewSales.class).list();//query.list();
		//salesList=(ArrayList<ViewSales>)session.createCriteria(ViewSales.class).list();
		session.getTransaction().commit();
		session.close();
		return salesList;
	}

}
