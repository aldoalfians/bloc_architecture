import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc_architecture/data/models/product.dart';

class ProductProvider {
  Future<Map<String, dynamic>> getDataProduct() async {
    try {
      Uri url = Uri.parse("https://pokeapi.co/api/v2/pokemon");
      var response = await http.get(url);

      if (response.statusCode != 200) {
        return {"error": true, "message": "${response.statusCode}"};
      }

      Map<String, dynamic> body = jsonDecode(response.body);

      return {
        "error": false,
        "message": "Berhasil mendaptakan data produk",
        "data": ProductModel.fromJson(body)
      };
    } catch (err) {
      return {
        "error": true,
        "message": "$err",
      };
    }
  }
}
