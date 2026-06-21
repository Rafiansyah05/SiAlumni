# SiAlumni - Sistem Informasi Alumni

Aplikasi web Alumni Management System berbasis Java, Servlet, dan JSP.

## Prerequisites

Sebelum menjalankan aplikasi, pastikan perangkat telah memiliki:

* Java 11 atau lebih baru
* Bash Terminal (Git Bash untuk Windows atau Terminal pada Linux/macOS)

> Maven telah disediakan di dalam proyek sehingga tidak diperlukan instalasi Maven secara terpisah.

---

## Struktur Project

```text
src/
├── main/
│   ├── java/
│   │   ├── controllers/     # Servlet Controllers
│   │   ├── models/          # Database Models
│   │   ├── interfaces/      # Interface Definitions
│   │   └── utils/           # Utility Classes
│   └── webapp/
│       ├── views/           # JSP Files
│       ├── assets/          # CSS, JavaScript, Images
│       └── WEB-INF/         # Configuration Files
```

---

## Instalasi

Clone repository:

```bash
git clone https://github.com/[username]/[repository-name]
cd [repository-name]
```

---

## Menjalankan Aplikasi

1. Buka terminal yang mendukung Bash (Git Bash pada Windows atau Terminal pada Linux/macOS).
2. Pastikan berada pada root directory proyek.
3. Jalankan perintah berikut:

```bash
./run.sh
```

4. Tunggu hingga proses build dan deployment selesai.
5. Buka browser dan akses:

```text
http://localhost:8080
```

---

## Database

SiAlumni menggunakan database PostgreSQL yang dihosting secara online melalui Supabase.

Seluruh konfigurasi koneksi database telah terintegrasi ke dalam aplikasi sehingga pengguna tidak perlu melakukan konfigurasi database, membuat database lokal, maupun mengimpor file SQL sebelum menjalankan sistem.

Setelah aplikasi dijalankan, sistem akan secara otomatis terhubung ke database yang telah disediakan.

---

## Akun Demo

### Admin

* Email: `admin2@sialumni.ac.id`
* Password: `admin123`

### Alumni

* Email: `alumni02@sialumni.ac.id`
* Password: `alumni123`

---

## Dependencies

* PostgreSQL JDBC Driver 42.6.0
* Servlet API 4.0.1
* JSP API 2.3.3
* JSTL 1.2

---

## Troubleshooting

### Port 8080 Sedang Digunakan

Edit file `pom.xml` dan ubah konfigurasi port pada plugin Tomcat:

```xml
<configuration>
    <path>/</path>
    <port>8081</port>
</configuration>
```

Kemudian akses aplikasi melalui:

```text
http://localhost:8081
```

---

## Development

Untuk melakukan pengembangan:

* Source code Java berada pada `src/main/java/`
* JSP berada pada `src/main/webapp/views/`
* Asset statis berada pada `src/main/webapp/assets/`

Setelah melakukan perubahan, jalankan kembali:

```bash
./run.sh
```

---

## Build Output

Output hasil build akan tersimpan pada:

* WAR File: `target/SiAlumni-1.0-SNAPSHOT.war`
* Compiled Classes: `target/classes/`
* Exploded WAR: `target/SiAlumni-1.0-SNAPSHOT/`
