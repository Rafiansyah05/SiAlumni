package models;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public abstract class JDBC {

    private static final String DEFAULT_DB_URL = "jdbc:postgresql://aws-1-ap-south-1.pooler.supabase.com:6543/postgres?user=postgres.tereexilkchduyiclgoy&password=SiAlumni567#&sslmode=require";
    private static final String DEFAULT_DB_USER = "postgres.tereexilkchduyiclgoy";
    private static final String DEFAULT_DB_PASS = "SiAlumni567#";

    public static final String DB_URL  = System.getenv("DB_URL")  != null && !System.getenv("DB_URL").isEmpty()  ? System.getenv("DB_URL")  : DEFAULT_DB_URL;
    public static final String DB_USER = System.getenv("DB_USER") != null && !System.getenv("DB_USER").isEmpty() ? System.getenv("DB_USER") : DEFAULT_DB_USER;
    public static final String DB_PASS = System.getenv("DB_PASS") != null && !System.getenv("DB_PASS").isEmpty() ? System.getenv("DB_PASS") :  DEFAULT_DB_PASS;
    public static final String SUPABASE_API_KEY = System.getenv("sb_publishable_-A-NUQledob1Q8cUxKTpLA__RJi3dqa");

    private static final HikariDataSource dataSource;
    private static final ThreadLocal<Connection> threadConnection = new ThreadLocal<>();

    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver PostgreSQL tidak ditemukan: " + e.getMessage());
        }
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl(DB_URL);
        config.setUsername(DB_USER);
        config.setPassword(DB_PASS);
        config.setDriverClassName("org.postgresql.Driver");
        
        // Optimasi Pool
        config.setMaximumPoolSize(10);
        config.setMinimumIdle(2);
        config.setConnectionTimeout(30000);
        config.setIdleTimeout(600000);
        config.setLeakDetectionThreshold(10000);
        
        dataSource = new HikariDataSource(config);
    }

    // Dynamic Proxy for backward compatibility and thread-safety
    protected final Connection conn = (Connection) java.lang.reflect.Proxy.newProxyInstance(
        Connection.class.getClassLoader(),
        new Class<?>[]{Connection.class},
        (proxy, method, args) -> {
            Connection realConn = threadConnection.get();
            if (realConn == null) {
                throw new SQLException("Connection is not established. Call connect() first.");
            }
            try {
                return method.invoke(realConn, args);
            } catch (java.lang.reflect.InvocationTargetException e) {
                throw e.getCause();
            }
        }
    );

    public static Connection getConnection() throws SQLException {
        long start = System.currentTimeMillis();
        Connection realConn = dataSource.getConnection();
        long end = System.currentTimeMillis();
        System.out.println("[PERF-LOG] Pooled connection obtained in " + (end - start) + " ms");
        return getProfiledConnection(realConn);
    }

    private static Connection getProfiledConnection(final Connection realConn) {
        return (Connection) java.lang.reflect.Proxy.newProxyInstance(
            Connection.class.getClassLoader(),
            new Class<?>[]{Connection.class},
            (proxy, method, args) -> {
                if ("prepareStatement".equals(method.getName()) && args.length > 0 && args[0] instanceof String) {
                    final String sql = (String) args[0];
                    try {
                        PreparedStatement realPs = (PreparedStatement) method.invoke(realConn, args);
                        return getProfiledPreparedStatement(realPs, sql);
                    } catch (java.lang.reflect.InvocationTargetException e) {
                        throw e.getCause();
                    }
                }
                try {
                    return method.invoke(realConn, args);
                } catch (java.lang.reflect.InvocationTargetException e) {
                    throw e.getCause();
                }
            }
        );
    }

    private static PreparedStatement getProfiledPreparedStatement(final PreparedStatement realPs, final String sql) {
        return (PreparedStatement) java.lang.reflect.Proxy.newProxyInstance(
            PreparedStatement.class.getClassLoader(),
            new Class<?>[]{PreparedStatement.class},
            (proxy, method, args) -> {
                String methodName = method.getName();
                if ("execute".equals(methodName) || "executeQuery".equals(methodName) || "executeUpdate".equals(methodName)) {
                    long start = System.currentTimeMillis();
                    try {
                        return method.invoke(realPs, args);
                    } catch (java.lang.reflect.InvocationTargetException e) {
                        throw e.getCause();
                    } finally {
                        long duration = System.currentTimeMillis() - start;
                        System.out.println("[PERF-LOG] Query: \"" + sql.replaceAll("\\s+", " ").trim() + "\" executed in " + duration + " ms");
                    }
                }
                try {
                    return method.invoke(realPs, args);
                } catch (java.lang.reflect.InvocationTargetException e) {
                    throw e.getCause();
                }
            }
        );
    }

    protected void connect() {
        try {
            if (threadConnection.get() == null || threadConnection.get().isClosed()) {
                threadConnection.set(getConnection());
            }
        } catch (SQLException e) {
            System.out.println("Gagal konek ke database: " + e.getMessage());
            e.printStackTrace();
        }
    }

    protected void disconnect() {
        try {
            Connection c = threadConnection.get();
            if (c != null) {
                if (!c.isClosed()) {
                    c.close();
                }
                threadConnection.remove();
            }
        } catch (SQLException e) {
            System.out.println("Gagal tutup koneksi: " + e.getMessage());
        }
    }

    public abstract String getProfile();
}
