import 'package:bakery/models/bakerymodel.dart';
import 'package:bakery/models/cakemodel.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  // static Future<List<User>> getData() async {
  //   var url = Uri.https('jsonplaceholder.typicode.com', '/users');
  //   var res = await http.get(url);
  //   var jsonData = res.body;
  //   //print(jsonData);
  //   return userFromJson(jsonData);
  // }

  static Future<List<Bakery>> getBakes() async {
    var url = Uri.http('localhost:3000', '/bakery');
    var res = await http.get(url);
    var jsonData = res.body;
    //print(jsonData);
    return bakeryFromJson(jsonData);
  }

  static Future<List<Cake>> getCakes() async {
    var url = Uri.http('localhost:3000', '/cakes');
    var res = await http.get(url);
    var jsonResponse = res.body;
    print(jsonResponse);
    return cakeFromJson(jsonResponse);
  }

  static Future<List<Cake>> addToCart(String id) async {
    var url = Uri.http('127.0.0.2:3000', '/cart/607a9612991175166018591d/$id');
    var res = await http.post(url);
    var jsonResponse = res.body;
    print(jsonResponse);
    return cakeFromJson(jsonResponse);
  }

  static removeCart(String id) async {
    var url =
        Uri.http('127.0.0.2:3000', '/remove/607a9612991175166018591d/$id');
    var res = await http.post(url);
    var jsonResponse = res.body;
    print(jsonResponse);
    //return cakeFromJson(jsonResponse);
  }

  static Future<List<Cake>> myCartItems() async {
    var url = Uri.http('127.0.0.2:3000', '/cart/607a9612991175166018591d');
    var res = await http.get(url);
    var jsonResponse = res.body;
    return cakeFromJson(jsonResponse);
  }
}
