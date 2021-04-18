import 'package:bakery/pages/cartpage.dart';
import 'package:bakery/services/apiservice.dart';
import 'package:bakery/services/cartservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final apiService = Get.put(ApiService());
  final cartService = Get.put(CartService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: GetX<CartService>(builder: (controller) {
              return MaterialButton(
                onPressed: () {
                  Get.to(() => CartPage());
                },
                child: Text(
                  '${controller.getCount}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            }),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GetX<ApiService>(builder: (controller) {
              if (controller.cakes.length == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return GridView.builder(
                  itemCount: controller.cakes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 5,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                color: Colors.redAccent,
                              ),
                              child: Image.network(
                                  '${controller.cakes[index].image}',
                                  fit: BoxFit.cover)),
                          SizedBox(height: 50),
                          Text(controller.cakes[index].name.toString()),
                          SizedBox(height: 10),
                          Text(controller.cakes[index].price.toString()),
                          MaterialButton(
                            color: Colors.blue,
                            onPressed: () {
                              cartService.addtocart(controller.cakes[index]);
                              cartService.cartCake(controller.cakes[index].id);
                            },
                            child: Text(
                              'Cart',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 50),
                        ],
                      )),
                    );
                  },
                );
              }
            }),
          ),
          GetX<CartService>(builder: (controller) {
            return Text(
              'Total Amount Rs ${controller.totalPrice}',
              style: TextStyle(fontSize: 25.0),
            );
          }),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
