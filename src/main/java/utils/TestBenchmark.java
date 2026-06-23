package utils;

import models.Admin;
import models.User;
import java.util.Map;
public class TestBenchmark {
    public static void main(String[] args) {
        System.out.println("=== STARTING BENCHMARK ===");
        try {
            long totalStart = System.currentTimeMillis();

            long start = System.currentTimeMillis();
            java.sql.Connection conn = models.JDBC.getConnection();
            long connTime = System.currentTimeMillis() - start;
            System.out.println("Raw connection creation time: " + connTime + " ms");
            conn.close();

            start = System.currentTimeMillis();
            User user = new User();
            boolean loggedIn = user.login("admin2@sialumni.ac.id", "admin123");
            long loginTime = System.currentTimeMillis() - start;
            System.out.println("Login processing time (success=" + loggedIn + "): " + loginTime + " ms");

            Admin admin = new Admin();
            admin.setIdUser("admin-002");
            admin.setName("Admin Baru");

            start = System.currentTimeMillis();
            Map<String,Integer> stats = admin.getDashboardStats();
            long dashboardTime = System.currentTimeMillis() - start;
            System.out.println("Dashboard stats time: " + dashboardTime + " ms");
            System.out.println("Total Alumni: " + stats.getOrDefault("totalAlumni", 0));
            System.out.println("Alumni Aktif: " + stats.getOrDefault("alumniAktif", 0));
            System.out.println("Email Sent: " + stats.getOrDefault("emailSent", 0));

            start = System.currentTimeMillis();
            admin.getDaftarAlumni();
            long fetchAllTime = System.currentTimeMillis() - start;
            System.out.println("getDaftarAlumni (Fetch ALL) time: " + fetchAllTime + " ms");

            start = System.currentTimeMillis();
            admin.getDaftarAlumniPaginated(0, 10);
            long fetchPaginatedTime = System.currentTimeMillis() - start;
            System.out.println("getDaftarAlumniPaginated (0, 10) time: " + fetchPaginatedTime + " ms");

            long totalEnd = System.currentTimeMillis() - totalStart;
            System.out.println("Total benchmark execution time: " + totalEnd + " ms");
            System.out.println("=== BENCHMARK COMPLETE ===");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
