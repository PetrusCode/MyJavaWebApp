package com.webapp.singleton;

import java.io.IOException;
import java.util.Properties;

//Forma basica de conexion mediante singleton
public class SingletonProperties {

	private static SingletonProperties instancia = null;
	private Properties p;

	private SingletonProperties() {

		p = new Properties();
		try {
			p.load(getClass().getClassLoader()
					.getResourceAsStream("pro-database.properties"));
		} catch (IOException e) {
// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static SingletonProperties getInstancia() {

		if (instancia == null) {

			instancia = new SingletonProperties();
		}
		return instancia;
	}

	public String getPropiedad(String clave) {

		return p.getProperty(clave);
	}
}
