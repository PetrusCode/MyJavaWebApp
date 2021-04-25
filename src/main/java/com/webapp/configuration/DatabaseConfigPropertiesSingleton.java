package com.webapp.configuration;

import java.io.IOException;
import java.util.Properties;

//Forma  de conexion utilizando Singleton, variable de entorno y archivos properties
public class DatabaseConfigPropertiesSingleton {

	private static DatabaseConfigPropertiesSingleton instancia = null;
	private Properties p;

	private DatabaseConfigPropertiesSingleton() {

		p = new Properties();
		try {
			String environment = System.getenv("Entorno");
			String propFileName = environment + "-mongodatabase.properties";

			p.load(getClass().getClassLoader()
					.getResourceAsStream(propFileName));
		} catch (IOException e) {
// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static DatabaseConfigPropertiesSingleton getInstancia() {

		if (instancia == null) {

			instancia = new DatabaseConfigPropertiesSingleton();
		}
		return instancia;
	}

	public String getPropiedad(String clave) {

		return p.getProperty(clave);
	}

	public String getConnectionString() {

		return "jdbc:mysql://" + p.getProperty("server") + "/"
				+ p.getProperty("database");
	}

	public String getDatabaseUser() {

		return p.getProperty("user");
	}

	public String getDatabasePwd() {

		return p.getProperty("pass");
	}

	public String getDatabaseDriver() {

		return p.getProperty("mysql-driver");
	}

	public String getMongodbConnectionString() {

		return p.getProperty("mongodb-connectionstring");
	}
}
