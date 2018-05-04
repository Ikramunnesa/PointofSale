package com.dal;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.bean.Order;


public class OrderGateway {
	SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
	Session session;
	
	public int saveOrder(Order order)
	{
		session=sessionFactory.openSession();
		session.beginTransaction();
		int rowEffected=(Integer)session.save(order);
		session.getTransaction().commit();
		session.close();
		return rowEffected;
	}
	
	public List<Order> getAllOrder()
	{
		List<Order> orderList=new ArrayList<Order>();
		session=sessionFactory.openSession();
		session.beginTransaction();
		orderList=(ArrayList<Order>)session.createCriteria(Order.class).list();
		session.getTransaction().commit();
		session.close();
		return orderList;
	}

}
