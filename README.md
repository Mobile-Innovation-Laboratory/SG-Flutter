# 4-StateManagementP1

Branch ini adalah lanjutan dari branch `3.5-Intro_State`. Pada branch ini, kita akan management **State** dalam Flutter untuk untuk performa dan memanfaatkan kemampuan widget secara optimal.

---

## **Pengenalan State Management dengan GetX**

State Management dalam Flutter adalah cara untuk mengelola data yang dapat berubah selama aplikasi berjalan, seperti data yang berasal dari pengguna, API, atau interaksi UI lainnya. GetX adalah salah satu package Flutter yang menyediakan pendekatan efisien, reaktif, dan minimalis untuk state management, dependency injection, dan routing.

### **Implementasi GetX dengan Reactive**

1. Menambah Depedensi |
   File: `pubspec.yaml`

```dart
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5
```

2. Ubah MaterialApp menjadi GetMaterialApp |
   File: `main.dart`

```dart
return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightMode,
          darkTheme: AppTheme.darkMode,
          themeMode: ThemeMode.system,
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginPage(),
            '/register': (context) => const RegisterPage(),
            '/dashboard': (context) => const DashboardPage(),
            '/detail-product': (context) => const DetailProductPage(),
            '/cart': (context) => const CartPage(),
          },
        );
```

3. Buat File Controller dengan **extends** GetxController |
   File: `controller/cart_controller.dart`

```dart
class CartController extends GetxController {
  RxDouble totalProduct = 0.0.obs;
  RxMap<String, int> quantities = <String, int>{}.obs;

  void incrementQuantity(String productId) {
    if (quantities.containsKey(productId)) {
      quantities[productId] = quantities[productId]! + 1;
    } else {
      quantities[productId] = 1;
    }
    update();
  }

  void decrementQuantity(String productId) {
    if (quantities.containsKey(productId)) {
      if (quantities[productId]! <= 1) {
        Get.defaultDialog(
          title: 'Remove Item',
          middleText: 'Do you want to remove this item from cart?',
          textConfirm: 'Yes',
          textCancel: 'No',
          confirmTextColor: Colors.white,
          onConfirm: () {
            quantities.remove(productId);
            update();
            Get.back();
          },
          buttonColor: const Color(0xFF00623B),
          contentPadding: const EdgeInsets.all(20),
          titlePadding: const EdgeInsets.only(top: 20),
        );
      } else {
        quantities[productId] = quantities[productId]! - 1;
        update();
      }
    }
  }

  int getQuantity(String productId) {
    return quantities[productId] ?? 0;
  }

  double calculateTotal() {
    double total = 0.0;
    quantities.forEach((productId, quantity) {
      ProductModel product = DataDummy.listDummyProducts.firstWhere(
        (product) => product.id == productId,
      );
      total += product.price * quantity;
    });
    return total;
  }
}
```

4. Ubah extends Stateless menjadi GetView<nama_controller> untuk Menghubungkan Controller |
   File: `pages/cart_pages.dart`

```dart
class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    ...UI
  }
}
```

5. Wrap dengan Obx untuk widget yang melakukan atau mendengarkan perubahan state |
   File: `pages/cart_pages.dart`

```dart
Obx(
  () => Text(
    '\$${controller.calculateTotal().toStringAsFixed(2)}',
    style: Theme.of(context).textTheme.headlineMedium,
    ),
  ),
```

---

## **Contoh Widget Lifecycle pada GetX**

| Metode  | Penjelasan                                                                                                  |
| ------- | ----------------------------------------------------------------------------------------------------------- |
| onInit  | Dipanggil sekali ketika controller diinisialisasi. Cocok untuk inisialisasi data atau listener.             |
| onReady | Dipanggil setelah widget pertama kali dirender. Cocok untuk API call atau proses berat lainnya.             |
| onClose | Dipanggil ketika controller dihancurkan. Cocok untuk membersihkan listener atau sumber daya yang digunakan. |
