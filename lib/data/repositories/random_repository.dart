import 'dart:math';

import 'package:bloc_architecture/data/models/data_home.dart';
import 'package:bloc_architecture/data/models/product.dart';
import 'package:bloc_architecture/data/models/user.dart';
import 'package:bloc_architecture/data/providers/product_provider.dart';
import 'package:bloc_architecture/data/providers/user_provider.dart';
import 'package:http/retry.dart';

class RandomRepository {
  UserProvider userProvider = UserProvider();
  ProductProvider productProvider = ProductProvider();

  Future<Map<String, dynamic>> getRandomData() async {
    Map<String, dynamic> dataUser = await userProvider.getDataUser();
    Map<String, dynamic> dataProduct = await productProvider.getDataProduct();

    if (dataUser["error"] == true) {
      return dataUser;
    }
    if (dataProduct["error"] == true) {
      return dataProduct;
    }
    // Get Random User
    UserModel userModel = dataUser["data"] as UserModel;

    late DataUser dataRandomUser;

    if (userModel.data != null) {
      dataRandomUser = userModel.data!.randomUser();
    } else {
      dataRandomUser = DataUser();
    }

    // Get Random Masakan
    ProductModel productModel = dataProduct["data"] as ProductModel;

    late Results dataRandomProduct;

    if (productModel.results != null) {
      dataRandomProduct = productModel.results!.randomProduct();
    } else {
      dataRandomProduct = Results();
    }

    return {
      "error": false,
      "message": "Berhasil mengambil data",
      "data": DataHomeModel(
          fullname: "${dataRandomUser.firstName} ${dataRandomUser.lastName}",
          email: "${dataRandomUser.email}",
          profile: "${dataRandomUser.avatar}",
          nameAnimal: "${dataRandomProduct.name}",
          imageAnimal: "${dataRandomProduct.url}"),
    };
  }
}

extension RandomUser on List<DataUser> {
  DataUser randomUser() {
    return elementAt(Random().nextInt(length - 1));
  }
}

extension RandomMasakan on List<Results> {
  Results randomProduct() {
    return elementAt(Random().nextInt(length - 1));
  }
}
