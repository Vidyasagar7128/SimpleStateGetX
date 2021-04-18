import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/cartservice.dart';

class CartPage extends StatelessWidget {
  final cartService = Get.put(CartService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          GetX<CartService>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: Text(
                '${controller.getCount}',
                style: TextStyle(fontSize: 20),
              ),
            );
          })
        ],
      ),
      body: GetX<CartService>(builder: (controller) {
        return ListView.builder(
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                controller.delCart(controller.cartItems[index].id);
                cartService.delItemCart(controller.cartItems[index]);
              },
              title: Text(controller.cartItems[index].name.toString()),
              trailing: IconButton(
                  tooltip: '${controller.cartItems[index].id}',
                  splashRadius: 25.0,
                  icon: Icon(Icons.shopping_bag),
                  onPressed: () {
                    Get.defaultDialog(
                        radius: 5.0,
                        onCancel: () {},
                        onConfirm: () {},
                        textConfirm: 'Order',
                        buttonColor: Colors.green,
                        cancelTextColor: Colors.black,
                        confirmTextColor: Colors.white,
                        title: '${controller.cartItems[index].name.toString()}',
                        content: Column(
                          children: [
                            Container(
                              height: 120.0,
                              width: MediaQuery.of(context).size.width * 0.1,
                              child: Image.network(
                                  controller.cartItems[index].image,
                                  fit: BoxFit.fill),
                            ),
                            SizedBox(height: 20.0),
                            Text('Price ${controller.cartItems[index].price}'),
                          ],
                        ));
                  }),
            );
          },
        );
      }),
    );
  }
}
