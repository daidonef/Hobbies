package com.daidonef.hobbiedata;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class ItemDAO {
	
	private static SessionFactory factory;

	private static void setupFactory() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			;
		}
		Configuration configuration = new Configuration();
		configuration.configure("hibernate.cfg.xml");
		configuration.addResource("item.hbm.xml");
		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
				.applySettings(configuration.getProperties()).build();
		factory = configuration.buildSessionFactory(serviceRegistry);
	}
	
	public static int addItem(Item item) {
		if (factory == null)
			setupFactory();
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		int i = (Integer) hibernateSession.save(item);
		hibernateSession.getTransaction().commit(); 
		hibernateSession.close();
		return i;
	}
	
	public static List<Item> getItem(String query) { 
		if (factory == null)
			setupFactory();
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		List<Item> items = hibernateSession.createQuery(query).list();
		hibernateSession.getTransaction().commit();
		hibernateSession.close();
		return items;
	}
	
	public static void updateItem(Item item) {
		if (factory == null)
			setupFactory();	
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		hibernateSession.merge(item);
		hibernateSession.getTransaction().commit();
		hibernateSession.close();
	}
	
	public static Item deleteItem(int i) {
		if (factory == null)
			setupFactory();	
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		Item item = hibernateSession.get(Item.class, i);
		hibernateSession.delete(item);
		hibernateSession.getTransaction().commit();
		hibernateSession.clear();
		return item;
	}

}
