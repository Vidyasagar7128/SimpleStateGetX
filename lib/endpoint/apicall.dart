import 'package:bakery/models/bakerymodel.dart';
import 'package:bakery/models/cakemodel.dart';
import 'package:bakery/models/usermodel.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  static Future<List<User>> getData() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/users');
    var res = await http.get(url);
    var jsonData = res.body;
    //print(jsonData);
    return userFromJson(jsonData);
  }

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
    var jsonData = res.body;
    print(jsonData);
    return cakeFromJson(jsonData);
  }
}
