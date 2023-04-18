import 'package:bloc_architecture/data/providers/product_provider.dart';
import 'package:bloc_architecture/data/providers/user_provider.dart';
import 'package:bloc_architecture/data/repositories/random_repository.dart';

void main() async {
  RandomRepository randomRepository = RandomRepository();
  print(await randomRepository.getRandomData());

  UserProvider userProvider = UserProvider();
  ProductProvider productProvider = ProductProvider();

  print(await userProvider.getDataUser());
  print(await productProvider.getDataProduct());
}
