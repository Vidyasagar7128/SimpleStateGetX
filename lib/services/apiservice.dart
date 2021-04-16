import 'package:bakery/endpoint/apicall.dart';
import 'package:bakery/models/bakerymodel.dart';
import 'package:bakery/models/cakemodel.dart';
import 'package:get/get.dart';

class ApiService extends GetxController {
  RxList bakery = RxList<Bakery>();
  RxList cakes = RxList<Cake>();
  @override
  void onInit() {
    super.onInit();
    getCakes();
  }

  getBakeries() async {
    List<Bakery> data = await ApiCall.getBakes();
    bakery.assignAll(data);
  }

  getCakes() async {
    List<Cake> data = await ApiCall.getCakes();
    cakes.assignAll(data);
  }
}
