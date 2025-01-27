import 'package:dio/dio.dart';
import 'package:study_group_flutter/app/data/models/user_model.dart';

import '../models/product_model_api.dart';
import '../../shared/constanta.dart';

class RemoteDatasourceService {
  final Dio dio = Dio();

  Future<Product> getProductsService() async {
    try {
      final response = await dio.get('$url/products/');

      if (response.statusCode == 200 && response.data != null) {
        return Product.fromJson(response.data);
      } else {
        throw Exception(
            'Fetch data failed. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Error: ${e.response?.data['message']}');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Error during product retrieval: $e');
    }
  }

  Future<ProductElement?> getDetailsProducts({required int id}) async {
    try {
      final response = await dio.get('$url/products/$id');
      if (response.statusCode == 200) {
        return ProductElement.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<String>> getProductCategoryListService() async {
    try {
      final response = await dio.get(
        '$url/products/category-list',
      );

      if (response.statusCode == 200 && response.data != null) {
        return List<String>.from(response.data);
      } else {
        throw Exception(
            'Get Product Category failed. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response?.data['message']);
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Error during get product category: $e');
    }
  }

  Future<UserModel> loginService({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '$url/auth/login',
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception('Login failed. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response?.data['message']);
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }
}
