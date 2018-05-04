package com.dal;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.bean.Customer;

public class CustomerGateway {
	SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
	Session session;
	
	public int saveCustomer(Customer customer)
	{
		session=sessionFactory.openSession();
		session.beginTransaction();
		int rowEffected=(Integer)session.save(customer);
		session.getTransaction().commit();
		session.close();
		return rowEffected;
	}
	
	public List<Customer> getAllCustomer()
	{
		List<Customer> cusList=new ArrayList<Customer>();
		session=sessionFactory.openSession();
		session.beginTransaction();
		cusList=(ArrayList<Customer>)session.createCriteria(Customer.class).list();
		session.getTransaction().commit();
		session.close();
		return cusList;
	}

}
