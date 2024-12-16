# 3.5-Intro_State

Branch ini adalah lanjutan dari branch `3-Package&Navigation`. Pada branch ini, kita akan mempelajari pengenalan **State** dalam Flutter, bagaimana cara mengelola state, serta memahami **Widget Lifecycle** untuk memanfaatkan kemampuan widget secara optimal.

---

## **Pengenalan State**

Dalam Flutter, **state** adalah data yang dapat berubah selama aplikasi berjalan. Misalnya, data yang berasal dari pengguna, API, atau interaksi UI lainnya.

Pada branch ini, kita menggunakan **StatefulWidget** untuk mengelola data seperti kategori yang dipilih dan daftar produk yang difilter. Berikut adalah contoh kode yang digunakan:

### **Contoh Implementasi StatefulWidget**

File: `home_page.dart`

```dart
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';
  List<ProductModel> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = DataDummy.listDummyProducts;
  }

  void filterProducts(String category) {
    setState(() {
      selectedCategory = category;
      if (category == 'All') {
        filteredProducts = DataDummy.listDummyProducts;
      } else {
        filteredProducts = DataDummy.listDummyProducts
            .where((product) => product.type == category)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ... // UI Implementasi
    );
  }
}
```

---

## **Widget Lifecycle**

Widget Lifecycle membantu memahami tahapan hidup dari sebuah widget di Flutter. Widget lifecycle terdapat pada widget jenis **Stateful**, dan hal ini sangat penting untuk mengatur sumber daya seperti listener, animasi, atau API call. Memahami lifecycle juga berpengaruh signifikan terhadap performa aplikasi karena temen-temen dapat mengoptimalkan penggunaan sumber daya dan memastikan bahwa tidak ada kebocoran memori atau proses yang berjalan tidak perlu.

### **Contoh Widget Lifecycle**

| Metode    | Penjelasan                                                                                                         |
| --------- | ------------------------------------------------------------------------------------------------------------------ |
| initState | Dipanggil sekali saat widget pertama kali dibuat. Cocok untuk inisialisasi data atau listener.                     |
| build     | Dipanggil setiap kali widget perlu dirender ulang. Tempat utama untuk membuat UI aplikasi.                         |
| setState  | Digunakan untuk memperbarui state dan memicu render ulang widget.                                                  |
| dispose   | Dipanggil saat widget dihapus dari widget tree. Cocok untuk membersihkan listener atau sumber daya yang digunakan. |
