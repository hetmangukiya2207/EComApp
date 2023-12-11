import 'dart:convert';
import 'package:ecomapp/module/Views/HomePage/model/ItemModel.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  APIHelper._();

  static APIHelper apiHelper = APIHelper._();

  Future<ItemModel?> fetchItemData(String location) async {
    String baseUrl =
        "https://fakestoreapi.com/products";

    http.Response res = await http.get(Uri.parse(baseUrl));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      ItemModel itemData = ItemModel.formMap(data: decodedData);

      return itemData;
    }
    return null;
  }
}