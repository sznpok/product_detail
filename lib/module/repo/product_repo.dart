import 'package:dio/dio.dart';

import '../model/product_model.dart';

class ProductRepo {
  String url =
      "https://oriflamenepal.com/api/product/for-public/smart-sync-lipstick-233";

  Dio dio = Dio();

  Future<ProductDataModel> getProduct() async {
    final response = await dio.get(
      url,
    );
    if (response.statusCode == 200) {
      return ProductDataModel.fromJson(response.data);
    } else {
      throw Exception("Error Fetching Data");
    }
  }
}
