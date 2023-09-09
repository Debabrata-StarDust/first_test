import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/api_model.dart';

List<GetJson> listData = [];
Future<List<GetJson>> fetchData() async {
  final response = await http
      .get(Uri.parse("http://universities.hipolabs.com/search?country=India"));
  var data = jsonDecode(response.body.toString());
  try {
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        listData.add(GetJson.fromJson(i));
        //print(listData);
        // print('this is json data coming ${i}');
        // if (queary != null) {
        //   listdata = listdata
        //       .where((element) =>
        //           element.name.toLowerCase().contains(queary.toLowerCase()))
        //       .toList();
        // }
      }
      return listData;
    } else {
      print("Api error");
    }
  } on Exception catch (e) {
    print("Error : $e");
  }
  return listData;
}
