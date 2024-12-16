# Branch: 3-Package&Navigation

Branch **`3-Package&Navigation`** merupakan lanjutan dari branch **`2-Slicing_UI`**. Pada branch ini, kita fokus pada penerapan _package_ pihak ketiga untuk meningkatkan fungsionalitas aplikasi dan mengimplementasikan sistem navigasi yang lebih terstruktur menggunakan Flutter.

---

## Apa yang terbaru?

### **1. Penambahan Folder Baru**

- **`common`**
  - **`theme`**: Berisi pengaturan tema aplikasi (dark mode dan light mode).
  - **`widgets`**: Berisi widget yang dapat digunakan kembali (_reusable widgets_).

### **2. Penggunaan Package**

Branch ini memperkenalkan beberapa _package_ Flutter untuk meningkatkan pengalaman pengembangan aplikasi, seperti:

- **`flutter_native_splash`**: Menambahkan layar splash native.
- **`flutter_screenutil`**: Membantu membuat desain responsif untuk berbagai ukuran layar.
- **`google_fonts`**: Menggunakan font dari Google Fonts.
- **`lottie`**: Menambahkan animasi Lottie ke aplikasi.

#### **Konfigurasi Pubspec.yaml**

Berikut adalah _dependencies_ yang digunakan (bisa disesuaikan dengan versi flutter yang digunakan):

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_native_splash: ^2.4.3
  flutter_screenutil: ^5.9.3
  google_fonts: ^6.2.1
  lottie: ^3.2.0
```

### **3. Sistem Navigasi**

Sistem navigasi telah diimplementasikan menggunakan properti routes pada MaterialApp, dengan daftar rute sebagai berikut:

| Route           |     Page      |
| :-------------- | :-----------: |
| /               |   LoginPage   |
| /register       | RegisterPage  |
| /dashboard      | DashboardPage |
| /product-detail | ProductDetail |
