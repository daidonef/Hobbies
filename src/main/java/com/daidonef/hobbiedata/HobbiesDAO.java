package com.daidonef.hobbiedata;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HobbiesDAO {
	
	private static SessionFactory factory;

	private static void setupFactory() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			;
		}
		Configuration configuration = new Configuration();
		configuration.configure("hibernate.cfg.xml");
		configuration.addResource("hobbies.hbm.xml");
		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
				.applySettings(configuration.getProperties()).build();
		factory = configuration.buildSessionFactory(serviceRegistry);
	}
	
	public static int addHobbies(Hobbies h) {
		if (factory == null)
			setupFactory();
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		int i = (Integer) hibernateSession.save(h);
		hibernateSession.getTransaction().commit(); 
		hibernateSession.close();
		return i;
	}
	
	public static List<Hobbies> getHobbies(String query) { 
		if (factory == null)
			setupFactory();
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		List<Hobbies> hobbies = hibernateSession.createQuery(query).list();
		hibernateSession.getTransaction().commit();
		hibernateSession.close();
		return hobbies;
	}
	
	public static void updateHobbies(Hobbies h) {
		if (factory == null)
			setupFactory();	
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		hibernateSession.merge(h);
		hibernateSession.getTransaction().commit();
		hibernateSession.close();
	}
	
	public static Hobbies deleteHobbies(int i) {
		if (factory == null)
			setupFactory();	
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		Hobbies hobbies = hibernateSession.get(Hobbies.class, i);
		hibernateSession.delete(hobbies);
		hibernateSession.getTransaction().commit();
		hibernateSession.clear();
		return hobbies;
	}

}
