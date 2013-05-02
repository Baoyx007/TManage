/**
 *
 */
package edu.ahut.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author Haven
 * @date 2013-3-19
 *
 */
public final class JdbcUtils {

    private static ComboPooledDataSource dataSource;
    // 这个就是连接池
    private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();

    static {
        dataSource = new ComboPooledDataSource();
    }

    // 取得数据源
    public static ComboPooledDataSource getDataSource() {
        return dataSource;
    }

    // 取得连接
    public static Connection getMySqlConnection() throws SQLException {
        Connection conn = tl.get();
        if (conn == null) {
            conn = dataSource.getConnection();
            tl.set(conn);
        }
        return conn;
    }

    public static void closeConnection() throws SQLException {
        Connection conn = getMySqlConnection();
        close(conn);
        tl.remove();
    }

    public static void begin() throws SQLException {
        Connection conn = getMySqlConnection();
        conn.setAutoCommit(false);
    }

    public static void commit() throws SQLException {
        Connection conn = getMySqlConnection();
        conn.commit();
    }

    public static void rollback() throws SQLException {
        Connection conn = getMySqlConnection();
        conn.rollback();
    }

    public static void end() throws SQLException {
        Connection conn = getMySqlConnection();
        conn.setAutoCommit(true);
    }

    public static void free(ResultSet rs, Statement st, Connection conn) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            try {
                if (st != null) {
                    st.close();
                }
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
    // 关闭连接

    public static void close(Connection conn) throws SQLException {
        if (conn != null) {
            conn.close();
        }
    }

    public static void close(PreparedStatement pstmt) throws SQLException {
        if (pstmt != null) {
            pstmt.close();
        }
    }

    public static void close(ResultSet rs) throws SQLException {
        if (rs != null) {
            rs.close();
        }
    }
}
