package com.dal;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.bean.Product;

public class ProductGateway {
	SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
	Session session;
	
	public int saveProduct(Product product)
	{
		session=sessionFactory.openSession();
		session.beginTransaction();
		int rowEffected=(Integer)session.save(product);
		session.getTransaction().commit();
		session.close();
		return rowEffected;
	}
	
	public List<Product> getAllProduct()
	{
		List<Product> productList=new ArrayList<Product>();
		session=sessionFactory.openSession();
		session.beginTransaction();
		productList=(ArrayList<Product>)session.createCriteria(Product.class).list();
		session.getTransaction().commit();
		session.close();
		return productList;
	}

}
