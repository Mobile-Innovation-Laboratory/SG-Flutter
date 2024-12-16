# Branch: 2-Slicing_UI

Branch **`2-Slicing_UI`** merupakan minggu kedua dari SG Flutter di MotionLab. Pada branch ini, temen-temen akan mempelajari cara (_slicing_) desain UI menjadi code menggunakan Flutter, serta memahami struktur folder proyek.

---

## Struktur Folder

Branch ini memiliki struktur folder sebagai berikut:

### 1. **`models`**

- Berisi model data yang digunakan dalam aplikasi.
- Saat ini, terdapat model untuk **Product** (_Product Model_), yang merepresentasikan informasi produk seperti id, nama, harga, dan lain-lain.

### 2. **`pages`**

- Berisi halaman-halaman utama aplikasi:
  - **Dashboard Page**: Halaman utama berisikan beberapa page utama (Home, Favorite, Profile), dengan _bottom navigation bar_ untuk navigasi.
  - **Home Page**: Menampilkan daftar produk dalam bentuk _list view_.
  - **Product Detail Page**: Menampilkan detail produk yang dipilih.

### 3. **`utils`**

- Berisi utilitas atau data tambahan yang diperlukan dalam aplikasi.
- Saat ini, berisi **data dummy** produk yang digunakan untuk mengisi daftar produk di _Home Page_.
