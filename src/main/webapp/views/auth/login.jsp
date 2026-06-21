<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="id">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Login - SiAlumni</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
            <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico">
            <link rel="icon" type="image/x-icon"
                href="${pageContext.request.contextPath}/assets/images/logo_sialumni.png">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        </head>

        <body>

            <div class="auth-wrapper">
                <div class="auth-card">
                    <div class="auth-header">
                        <h1>Si<span>Alumni</span>.</h1>
                        <p>Selamat datang kembali! Silakan login.</p>
                    </div>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">
                            <i class="fas fa-exclamation-circle"></i> ${error}
                        </div>
                    </c:if>

                    <c:if test="${not empty success}">
                        <div class="alert alert-success">
                            <i class="fas fa-check-circle"></i> ${success}
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/auth" method="post">
                        <input type="hidden" name="action" value="login">

                        <div class="form-group">
                            <label for="email">Email Kampus</label>
                            <input type="email" id="email" name="email" class="form-control"
                                placeholder="nama@sialumni.ac.id" required>
                        </div>

                        <div class="form-group" style="position: relative;">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" class="form-control"
                                placeholder="••••••••" required>
                            <span toggle="#password" class="fa-solid fa-eye-slash toggle-password"
                                style="position:absolute; right:12px; top:38px; cursor:pointer; font-size:1.2rem; color: var(--text-muted);"></span>
                        </div>
                        <script>
                            document.querySelectorAll('.toggle-password').forEach(function (el) {
                                el.addEventListener('click', function () {
                                    const input = document.querySelector(this.getAttribute('toggle'));
                                    if (input.type === 'password') {
                                        input.type = 'text';
                                        this.classList.remove('fa-eye-slash');
                                        this.classList.add('fa-eye');
                                    } else {
                                        input.type = 'password';
                                        this.classList.remove('fa-eye');
                                        this.classList.add('fa-eye-slash');
                                    }
                                });
                            });
                        </script>
                        <style>
                            .form-group input[type='password'] {
                                padding-right: 2.5rem;
                            }
                        </style>


                        <div
                            style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px;">

                        </div>

                        <button type="submit" class="btn btn-primary">Masuk ke Sistem</button>
                    </form>

                    <div
                        style="text-align: center; margin-top: 30px; padding-top: 20px; border-top: 1px solid var(--border);">
                        <p style="color: var(--text-muted); font-size: 14px;">
                            Belum punya akun?
                            <a href="${pageContext.request.contextPath}/views/auth/register.jsp"
                                style="color: var(--primary); font-weight: 700; text-decoration: none;">Daftar
                                Sekarang</a>
                        </p>
                    </div>

                    <div style="text-align: center; margin-top: 20px;">
                        <a href="${pageContext.request.contextPath}/"
                            style="color: var(--text-muted); font-size: 14px; text-decoration: none;">
                            <i class="fas fa-arrow-left"></i> Kembali ke Beranda
                        </a>
                    </div>
                </div>
            </div>

        </body>

        </html>