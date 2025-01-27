import 'package:dio/dio.dart';
import 'package:study_group_flutter/app/data/models/user_model.dart';

import '../models/product_model_api.dart';
import '../../shared/constanta.dart';

class RemoteDatasourceService {
  final Dio dio = Dio();

  Future<Product?> getProducts() async {
    try {
      final response = await dio.get('$url/products/');
      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
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
