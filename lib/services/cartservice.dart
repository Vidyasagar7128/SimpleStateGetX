import 'package:bakery/endpoint/apicall.dart';
import 'package:bakery/models/cakemodel.dart';
import 'package:get/get.dart';

class CartService extends GetxController {
  RxList cartItems = RxList<Cake>();
  RxList cart = RxList<Cake>();
  @override
  void onInit() {
    super.onInit();
    carts();
  }

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  int get getCount => cartItems.length;
  addtocart(Cake cake) {
    cartItems.add(cake);
    print('ADD TO CART METHOD======= ${cake.name}');
  }

  delItemCart(Cake cake) {
    cartItems.remove(cake);
    print('DEL TO CART METHOD======= ${cake.name}');
  }

  cartCake(String id) async {
    List<Cake> data = await ApiCall.addToCart(id);
    cart.assignAll(data);
  }

  delCart(String id) async {
    // ignore: unused_local_variable
    var data = await ApiCall.removeCart(id);
    //cart.assignAll(data);
  }

  carts() async {
    List<Cake> data = await ApiCall.myCartItems();
    cartItems.assignAll(data);
  }
}
