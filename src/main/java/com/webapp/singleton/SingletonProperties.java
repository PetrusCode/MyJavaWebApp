package com.webapp.singleton;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class SingletonProperties {

	private static SingletonProperties instancia = null;
	private Properties p;

	private SingletonProperties() {
		p = new Properties();

		try {
			p.load(new FileInputStream(new File("pro-database.properties")));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static SingletonProperties getInstancia() {
		if (instancia == null) {
			instancia = new SingletonProperties();
		}
		return instancia;

	}

	public String getPropiedad(String server) {
		return p.getProperty(server);
	}
}
