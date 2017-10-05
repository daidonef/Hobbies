package com.daidonef.hobbiedata;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class GenreDAO {
	
	private static SessionFactory factory;

	private static void setupFactory() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			;
		}
		Configuration configuration = new Configuration();
		configuration.configure("hibernate.cfg.xml");
		configuration.addResource("genre.hbm.xml");
		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
				.applySettings(configuration.getProperties()).build();
		factory = configuration.buildSessionFactory(serviceRegistry);
	}
	
	public static int addGenre(Genre g) {
		if (factory == null)
			setupFactory();
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		int i = (Integer) hibernateSession.save(g);
		hibernateSession.getTransaction().commit(); 
		hibernateSession.close();
		return i;
	}
	
	public static List<Genre> getGenre(String query) { 
		if (factory == null)
			setupFactory();
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		List<Genre> genres = hibernateSession.createQuery(query).list();
		hibernateSession.getTransaction().commit();
		hibernateSession.close();
		return genres;
	}
	
	public static void updateGenre(Genre g) {
		if (factory == null)
			setupFactory();	
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		hibernateSession.merge(g);
		hibernateSession.getTransaction().commit();
		hibernateSession.close();
	}
	
	public static Genre deleteGenre(int i) {
		if (factory == null)
			setupFactory();	
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		Genre genre = hibernateSession.get(Genre.class, i);
		hibernateSession.delete(genre);
		hibernateSession.getTransaction().commit();
		hibernateSession.clear();
		return genre;
	}

}
