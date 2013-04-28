/**
 * 
 */
package edu.ahut.utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;

/**
 * @author Haven
 * @date 2013-3-19
 * 
 */
public final class JdbcUtils {
    private static DataSource dataSource = null;

    private JdbcUtils() {
    }

    static {
	try {
	    Class.forName("com.mysql.jdbc.Driver");
	    Properties prop = new Properties();
	    prop.load(JdbcUtils.class.getClassLoader().getResourceAsStream(
		    "dbcpconfig.properties"));
	    dataSource = BasicDataSourceFactory.createDataSource(prop);
	} catch (Exception e) {
	    throw new ExceptionInInitializerError(e);
	}
    }

    public static Connection getConnection() throws SQLException {
	// return DriverManager.getConnection(url, user, password);
	return dataSource.getConnection();
    }

    public static DataSource getDateSource() {
	return dataSource;
    }

    public static void free(ResultSet rs, Statement st, Connection conn) {
	try {
	    if (rs != null)

		rs.close();
	} catch (SQLException e) {

	    e.printStackTrace();
	} finally {
	    try {
		if (st != null)
		    st.close();
	    } catch (SQLException e) {

		e.printStackTrace();
	    } finally {
		if (conn != null) {
		    try {
			conn.close();
		    } catch (SQLException e) {

			e.printStackTrace();
		    }
		}
	    }
	}
    }
}
