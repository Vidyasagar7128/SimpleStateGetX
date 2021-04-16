import 'package:bakery/models/cakemodel.dart';
import 'package:get/get.dart';

class CartService extends GetxController {
  RxList cartItems = RxList<Cake>();
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  int get getCount => cartItems.length;
  addtocart(Cake cake) {
    cartItems.add(cake);
  }
}
