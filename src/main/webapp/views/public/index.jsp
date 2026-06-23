<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="id">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>SiAlumni - Sistem Informasi Alumni Terintegrasi</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style_index.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
            <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico">
            <link rel="icon" type="image/x-icon"
                href="${pageContext.request.contextPath}/assets/images/logo_sialumni.png">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        </head>

        <body>

            <!-- Navigation -->
            <nav class="navbar">
                <div class="container navbar-container">
                    <div class="navbar-brand">

                        <div>
                            <div class="navbar-title">Si<span>Alumni</span>.</div>
                            <div class="navbar-subtitle">Alumni Network</div>
                        </div>
                    </div>
                    <div class="navbar-menu">
                        <a href="#companies" class="navbar-link">Perusahaan</a>
                        <a href="#testimonials" class="navbar-link">Testimonial</a>
                        <a href="#stats" class="navbar-link">Statistik</a>
                        <a href="/auth" class="btn btn-primary navbar-btn">
                            Login
                        </a>
                    </div>
                </div>
            </nav>

            <!-- Hero Section -->

            <section class="hero">
                <div class="hero-background"></div>
                <div class="container hero-container">
                    <div class="hero-content">
                        <h1 class="hero-title">Platform Tracer Study Alumni Terintegrasi</h1>
                        <p class="hero-subtitle">
                            Jelajahi karir alumni terbaik kami, temukan peluang kolaborasi, dan bangun jaringan
                            profesional yang kuat
                        </p>

                    </div>
                    <div class="hero-stats">
                        <div class="hero-stat-item">
                            <div class="hero-stat-icon">
                                <i class="fas fa-user-graduate"></i>
                            </div>
                            <div class="hero-stat-content">
                                <div class="hero-stat-value">100+</div>
                                <div class="hero-stat-label">Alumni Terdaftar</div>
                            </div>
                        </div>
                        <div class="hero-stat-item">
                            <div class="hero-stat-icon">
                                <i class="fas fa-building"></i>
                            </div>
                            <div class="hero-stat-content">
                                <div class="hero-stat-value">50+</div>
                                <div class="hero-stat-label">Mitra Perusahaan</div>
                            </div>
                        </div>
                        <div class="hero-stat-item">
                            <div class="hero-stat-icon">
                                <i class="fas fa-chart-line"></i>
                            </div>
                            <div class="hero-stat-content">
                                <div class="hero-stat-value">95%</div>
                                <div class="hero-stat-label">Tingkat Penempatan</div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Main Content: Top Companies -->
            <main class="main-content-index">
                <section id="companies" class="companies-section">
                    <div class="container">
                        <div class="section-header">
                            <div class="section-badge">Top Perusahaan Penerimaan</div>
                            <h2 class="section-title">10 Perusahaan Favorit Alumni</h2>
                            <p class="section-subtitle">Perusahaan-perusahaan terkemuka yang mempercayai lulusan kami
                            </p>
                        </div>

                        <!-- Filter Section -->
                        <div class="filter-section">
                            <form action="/" method="get" class="filter-form">
                                <div class="filter-group">
                                    <label for="major-select" class="filter-label">
                                        <i class="fas fa-filter"></i> Filter Berdasarkan Jurusan
                                    </label>
                                    <select name="major" id="major-select" class="form-control filter-select">
                                        <option value="">-- Semua Jurusan --</option>
                                        <c:forEach var="m" items="${majors}">
                                            <option value="${m}" ${selectedMajor==m ? 'selected' : '' }>${m}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary filter-btn">
                                    <i class="fas fa-search"></i> Terapkan Filter
                                </button>
                            </form>
                        </div>

                        <!-- Companies Grid -->
                        <div class="companies-grid">
                            <c:forEach var="company" items="${companies}" varStatus="status">
                                <div class="company-card">
                                    <div class="company-card-header">
                                        <div class="company-rank">
                                            <span class="rank-number">#${status.index + 1}</span>
                                        </div>
                                        <div class="company-badge">
                                            <i class="fas fa-star"></i> Top Recruiter
                                        </div>
                                    </div>

                                    <div class="company-card-body">
                                        <div class="company-icon">
                                            <i class="fas fa-building"></i>
                                        </div>
                                        <h3 class="company-name">${company.name}</h3>
                                        <p class="company-location">
                                            <i class="fas fa-map-marker-alt"></i> ${company.location}
                                        </p>
                                    </div>

                                    <div class="company-card-footer">
                                        <div class="alumni-count">
                                            <i class="fas fa-users"></i>
                                            <span>${company.jumlahAlumni} Alumni Diterima</span>
                                        </div>
                                        <a href="#" class="company-link">
                                            <i class="fas fa-external-link-alt"></i>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>

                            <c:if test="${empty companies}">
                                <div class="empty-state">
                                    <div class="empty-icon">
                                        <i class="fas fa-inbox"></i>
                                    </div>
                                    <h3>Data Tidak Tersedia</h3>
                                    <p>Silakan pilih jurusan lain atau coba filter ulang.</p>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </section>

                <!-- Testimonial Section -->
                <section id="testimonials" class="testimonials-section">
                    <div class="container">
                        <div class="section-header">
                            <div class="section-badge">Kisah Sukses Alumni</div>
                            <h2 class="section-title">Dengarkan Cerita Mereka</h2>
                            <p class="section-subtitle">Pengalaman nyata dari alumni kami yang telah sukses dalam karir
                            </p>
                        </div>

                        <div class="testimonials-grid">
                            <!-- Testimonial 1 -->
                            <div class="testimonial-card">
                                <div class="testimonial-header">
                                    <div class="testimonial-avatar">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <div class="testimonial-info">
                                        <h4 class="testimonial-name">Reza Pratama</h4>
                                        <p class="testimonial-detail">S1 Teknik Informatika | 2020</p>
                                    </div>
                                </div>
                                <div class="testimonial-rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <p class="testimonial-message">
                                    "Pendidikan di kampus ini memberikan fondasi yang sangat kuat. Sekarang saya bekerja
                                    sebagai Software Engineer di Google dengan pengalaman yang relevan sejak masa
                                    kuliah."
                                </p>
                                <div class="testimonial-footer">
                                    <span class="job-badge">
                                        Senior Software Engineer, Google
                                    </span>
                                </div>
                            </div>

                            <!-- Testimonial 2 -->
                            <div class="testimonial-card">
                                <div class="testimonial-header">
                                    <div class="testimonial-avatar">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <div class="testimonial-info">
                                        <h4 class="testimonial-name">Siti Nurhaliza</h4>
                                        <p class="testimonial-detail">S1 Manajemen Bisnis | 2019</p>
                                    </div>
                                </div>
                                <div class="testimonial-rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <p class="testimonial-message">
                                    "Jaringan alumni yang luas membantu saya mendapatkan pekerjaan pertama. Kini saya
                                    menjadi Product Manager di startup teknologi terkemuka."
                                </p>
                                <div class="testimonial-footer">
                                    <span class="job-badge">
                                        Product Manager, PT Teknologi Indonesia
                                    </span>
                                </div>
                            </div>

                            <!-- Testimonial 3 -->
                            <div class="testimonial-card">
                                <div class="testimonial-header">
                                    <div class="testimonial-avatar">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <div class="testimonial-info">
                                        <h4 class="testimonial-name">Budi Santoso</h4>
                                        <p class="testimonial-detail">S1 Akuntansi | 2018</p>
                                    </div>
                                </div>
                                <div class="testimonial-rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <p class="testimonial-message">
                                    "Dari mahasiswa menjadi Finance Manager, perjalanan karir saya dimulai dengan ilmu
                                    yang saya dapatkan dari program akuntansi yang komprehensif."
                                </p>
                                <div class="testimonial-footer">
                                    <span class="job-badge">
                                        Finance Manager, PT Bank Nasional
                                    </span>
                                </div>
                            </div>

                            <!-- Testimonial 4 -->
                            <div class="testimonial-card">
                                <div class="testimonial-header">
                                    <div class="testimonial-avatar">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <div class="testimonial-info">
                                        <h4 class="testimonial-name">Eka Dwi Putri</h4>
                                        <p class="testimonial-detail">S1 Akuntansi | 2021</p>
                                    </div>
                                </div>
                                <div class="testimonial-rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <p class="testimonial-message">
                                    "Mentorship dari dosen dan kesempatan magang yang disediakan sangat membantu
                                    membangun portfolio saya yang sekarang bekerja di agensi kreatif internasional."
                                </p>
                                <div class="testimonial-footer">
                                    <span class="job-badge">
                                        Creative Director, Digital Agency Singapore
                                    </span>
                                </div>
                            </div>

                            <!-- Testimonial 5 -->
                            <div class="testimonial-card">
                                <div class="testimonial-header">
                                    <div class="testimonial-avatar">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <div class="testimonial-info">
                                        <h4 class="testimonial-name">Hendra Wijaya</h4>
                                        <p class="testimonial-detail">S1 Teknik Informatika | 2017</p>
                                    </div>
                                </div>
                                <div class="testimonial-rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <p class="testimonial-message">
                                    "Praktek langsung dalam proyek konstruksi membuat saya siap saat pertama kali
                                    bekerja. Sekarang saya menjadi Project Manager di perusahaan konstruksi terbesar."
                                </p>
                                <div class="testimonial-footer">
                                    <span class="job-badge">
                                        Project Manager, PT Konstruksi Indonesia
                                    </span>
                                </div>
                            </div>

                            <!-- Testimonial 6 -->
                            <div class="testimonial-card">
                                <div class="testimonial-header">
                                    <div class="testimonial-avatar">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <div class="testimonial-info">
                                        <h4 class="testimonial-name">Linda Hermawan</h4>
                                        <p class="testimonial-detail">S1 Manajemen Bisnis | 2020</p>
                                    </div>
                                </div>
                                <div class="testimonial-rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <p class="testimonial-message">
                                    "Program farmasi kami memberikan sertifikasi internasional yang membuka peluang
                                    untuk bekerja di perusahaan farmasi multinasional di berbagai negara."
                                </p>
                                <div class="testimonial-footer">
                                    <span class="job-badge">
                                        Pharmaceutical Manager, PT Pharma Global
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Statistics Section -->
                <section id="stats" class="stats-section">
                    <div class="container">
                        <div class="section-header">
                            <div class="section-badge">Data & Angka</div>
                            <h2 class="section-title">Pencapaian Alumni Kami</h2>
                        </div>

                        <div class="stats-grid">
                            <div class="stats-card">
                                <div class="stats-icon">
                                    <i class="fas fa-user-graduate"></i>
                                </div>
                                <div class="stats-content">
                                    <div class="stats-number">2,500+</div>
                                    <div class="stats-label">Total Alumni</div>
                                    <p class="stats-description">Lulusan dari berbagai program studi sejak tahun 1990
                                    </p>
                                </div>
                            </div>

                            <div class="stats-card">
                                <div class="stats-icon">
                                    <i class="fas fa-briefcase"></i>
                                </div>
                                <div class="stats-content">
                                    <div class="stats-number">95%</div>
                                    <div class="stats-label">Tingkat Penempatan</div>
                                    <p class="stats-description">Alumni yang terserap di industri dalam 6 bulan</p>
                                </div>
                            </div>

                            <div class="stats-card">
                                <div class="stats-icon">
                                    <i class="fas fa-globe"></i>
                                </div>
                                <div class="stats-content">
                                    <div class="stats-number">30+</div>
                                    <div class="stats-label">Negara</div>
                                    <p class="stats-description">Alumni tersebar di berbagai negara internasional</p>
                                </div>
                            </div>

                            <div class="stats-card">
                                <div class="stats-icon">
                                    <i class="fas fa-award"></i>
                                </div>
                                <div class="stats-content">
                                    <div class="stats-number">150+</div>
                                    <div class="stats-label">Mitra Industri</div>
                                    <p class="stats-description">Perusahaan yang bekerja sama dengan institusi kami</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Features Section -->
                <section class="features-section">
                    <div class="container">
                        <div class="section-header">
                            <div class="section-badge">Keunggulan Platform</div>
                            <h2 class="section-title">Mengapa Memilih SiAlumni</h2>
                            <p class="section-subtitle">Platform terpercaya untuk menghubungkan alumni dengan peluang
                                karir terbaik</p>
                        </div>

                        <div class="features-grid">
                            <div class="feature-card">
                                <div class="feature-icon">
                                    <i class="fas fa-network-wired"></i>
                                </div>
                                <h3 class="feature-title">Jaringan Alumni Luas</h3>
                                <p class="feature-description">Terhubung dengan ribuan alumni di berbagai industri dan
                                    posisi</p>
                            </div>

                            <div class="feature-card">
                                <div class="feature-icon">
                                    <i class="fas fa-chart-bar"></i>
                                </div>
                                <h3 class="feature-title">Data Karir Terukur</h3>
                                <p class="feature-description">Lacak perkembangan karir alumni secara real-time dengan
                                    data akurat</p>
                            </div>

                            <div class="feature-card">
                                <div class="feature-icon">
                                    <i class="fas fa-handshake"></i>
                                </div>
                                <h3 class="feature-title">Peluang Kolaborasi</h3>
                                <p class="feature-description">Temukan mitra bisnis dan peluang karir dari jaringan
                                    alumni</p>
                            </div>

                            <div class="feature-card">
                                <div class="feature-icon">
                                    <i class="fas fa-shield-alt"></i>
                                </div>
                                <h3 class="feature-title">Data Aman & Terpercaya</h3>
                                <p class="feature-description">Keamanan data alumni terjamin dengan enkripsi tingkat
                                    enterprise</p>
                            </div>

                            <div class="feature-card">
                                <div class="feature-icon">
                                    <i class="fas fa-mobile-alt"></i>
                                </div>
                                <h3 class="feature-title">Akses Dimana Saja</h3>
                                <p class="feature-description">Aplikasi responsif yang dapat diakses dari berbagai
                                    perangkat</p>
                            </div>

                            <div class="feature-card">
                                <div class="feature-icon">
                                    <i class="fas fa-headset"></i>
                                </div>
                                <h3 class="feature-title">Dukungan 24/7</h3>
                                <p class="feature-description">Tim support kami siap membantu Anda kapan saja</p>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- CTA Section -->
                <section class="cta-section">
                    <div class="container cta-container">
                        <div class="cta-content">
                            <h2 class="cta-title">Siap Memulai Perjalanan Karir Anda?</h2>
                            <p class="cta-subtitle">Bergabunglah dengan ribuan alumni yang telah meraih kesuksesan
                                bersama SiAlumni</p>
                            <div class="cta-buttons">
                                <a href="/views/auth/register.jsp" class="btn btn-primary btn-lg">
                                    Daftar Sebagai Alumni
                                </a>
                                <a href="#" class="btn btn-outline-light btn-lg"
                                    style="border: 2px solid rgb(95, 100, 138);">
                                    Hubungi Kami
                                </a>
                            </div>
                        </div>
                    </div>
                </section>
            </main>

            <!-- Footer -->
            <footer class="footer">
                <div class="container">
                    <div class="footer-content">
                        <div class="footer-section">
                            <div class="footer-brand">
                                <h3 class="footer-title">Si<span>Alumni</span>.</h3>
                                <p class="footer-description">
                                    Platform tracer study alumni yang menghubungkan lulusan dengan peluang karir terbaik
                                    di Indonesia dan dunia.
                                </p>
                                <div class="footer-social">
                                    <a href="#" class="social-link" title="Facebook">
                                        <i class="fab fa-facebook-f"></i>
                                    </a>
                                    <a href="#" class="social-link" title="Twitter">
                                        <i class="fab fa-twitter"></i>
                                    </a>
                                    <a href="#" class="social-link" title="LinkedIn">
                                        <i class="fab fa-linkedin-in"></i>
                                    </a>
                                    <a href="#" class="social-link" title="Instagram">
                                        <i class="fab fa-instagram"></i>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="footer-section">
                            <h4 class="footer-section-title">Navigasi</h4>
                            <ul class="footer-links">
                                <li><a href="#companies">Perusahaan</a></li>
                                <li><a href="#testimonials">Testimonial</a></li>
                                <li><a href="#stats">Statistik</a></li>
                                <li><a href="/auth">Login</a></li>
                            </ul>
                        </div>

                        <div class="footer-section">
                            <h4 class="footer-section-title">Program</h4>
                            <ul class="footer-links">
                                <li><a href="#">S1 Teknik Informatika</a></li>
                                <li><a href="#">S1 Manajemen Bisnis</a></li>
                                <li><a href="#">S1 Akuntansi</a></li>
                                <li><a href="#">S1 Sistem Informasi</a></li>
                                <li><a href="#">S1 Teknik Elektro</a></li>

                            </ul>
                        </div>

                        <div class="footer-section">
                            <h4 class="footer-section-title">Kontak</h4>
                            <ul class="footer-info">
                                <li>
                                    <i class="fas fa-map-marker-alt"></i>
                                    <span>Jl. Pendidikan No. 1, Jakarta, Indonesia</span>
                                </li>
                                <li>
                                    <i class="fas fa-phone"></i>
                                    <span>(021) 1234-5678</span>
                                </li>
                                <li>
                                    <i class="fas fa-envelope"></i>
                                    <span>info@sialumni.ac.id</span>
                                </li>
                                <li>
                                    <i class="fas fa-clock"></i>
                                    <span>Senin - Jumat: 09:00 - 17:00</span>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="footer-divider"></div>

                    <div class="footer-bottom">
                        <p class="footer-copyright">
                            &copy; 2026 SiAlumni. Semua hak dilindungi. Dikembangkan oleh <span
                                style="font-weight: bold;">Group 3</span> untuk alumni.
                        </p>
                        <div class="footer-links-bottom">
                            <a href="#">Kebijakan Privasi</a>
                            <a href="#">Syarat & Ketentuan</a>
                            <a href="#">Hubungi Kami</a>
                        </div>
                    </div>
                </div>
            </footer>

        </body>

        </html>