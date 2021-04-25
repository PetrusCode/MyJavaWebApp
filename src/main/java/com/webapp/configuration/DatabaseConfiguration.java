package com.webapp.configuration;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

//Forma basica de conexion mediante properties
public class DatabaseConfiguration {

	String result = "";
	InputStream inputStream;

	public String getPropValues(String enviromentVar) throws IOException {
		try {
			Properties prop = new Properties();
			String propFileName = enviromentVar + "-database.properties";

			inputStream = getClass().getClassLoader()
					.getResourceAsStream(propFileName);

			if (inputStream != null) {
				prop.load(inputStream);
			} else {
				throw new FileNotFoundException("property file '" + propFileName
						+ "' not found in the classpath");
			}

			String server = prop.getProperty("server");
			String database = prop.getProperty("database");
			String user = prop.getProperty("user");
			String pass = prop.getProperty("pass");

			result = "Database config List = " + server + ", " + database + ", "
					+ user + ", " + pass;
		} catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
		} finally {
			inputStream.close();
		}
		return result;
	}

}
