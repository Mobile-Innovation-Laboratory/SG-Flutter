import 'package:get/get.dart';
import 'package:study_group_flutter/app/data/models/product_model.dart';
import 'package:study_group_flutter/app/utils/data_dummy.dart';
import 'package:study_group_flutter/app/data/services/remote_datasource_service.dart';

import '../../../data/models/product_model_api.dart';

class HomeController extends GetxController {
  String selectedCategory = 'All';
  List<ProductModel> filteredProducts = [];

  RemoteDatasourceService remoteDatasourceService = RemoteDatasourceService();
  bool isLoading = true;
  Product product = Product();
  List<String> categoryList = [];

  @override
  void onInit() {
    super.onInit();
    getProduct();
    getProductCategoryList();
    filteredProducts = DataDummy.listDummyProducts;
  }

  void filterProducts(String category) {
    selectedCategory = category;
    update();

    if (category == 'All') {
      filteredProducts = DataDummy.listDummyProducts;
      update();
    } else {
      filteredProducts = DataDummy.listDummyProducts
          .where((product) => product.type == category)
          .toList();
      update();
    }
  }

  void getProduct() async {
    try {
      isLoading = true;
      update();

      product = await remoteDatasourceService.getProductsService();
      update();
    } finally {
      isLoading = false;
      update();
    }
  }

  void getProductCategoryList() async {
    try {
      isLoading = true;
      update();

      categoryList =
          await remoteDatasourceService.getProductCategoryListService();
      update();
    } catch (e) {
      Get.snackbar('Get Data Failed', e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }
}
