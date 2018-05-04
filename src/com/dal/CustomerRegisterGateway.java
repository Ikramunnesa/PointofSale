package com.dal;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.bean.CustomerRegister;

public class CustomerRegisterGateway {
	SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
	Session session;
	
	public int saveCustomerRegister(CustomerRegister register)
	{
		session=sessionFactory.openSession();
		session.beginTransaction();
		int rowEffected=(Integer)session.save(register);
		session.getTransaction().commit();
		session.close();
		return rowEffected;
	}
	
	public List<CustomerRegister> getAllCustomerRegister()
	{
		List<CustomerRegister> regList=new ArrayList<CustomerRegister>();
		session=sessionFactory.openSession();
		session.beginTransaction();
		regList=(ArrayList<CustomerRegister>)session.createCriteria(CustomerRegister.class).list();
		session.getTransaction().commit();
		session.close();
		return regList;
	}

}
