import 'dart:convert';

import 'package:corona/modles/countery.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as ht;

class ApiHelper {
  ApiHelper._();

  static final ApiHelper Covid = ApiHelper._();

  Future<List<coun>?> getDate({String c = ""}) async {
    String api = "https://disease.sh/v3/covid-19/countries/$c";

    ht.Response response = await ht.get(Uri.parse(api));

    if (response.statusCode == 200) {
      List co = json.decode(response.body);

      // kom = co.map((e) => coun.MakeList(data: e)).toList();
      print(co.runtimeType);
      List<coun> kom = co.map((e) => coun.tojson(data: e)).toList();
      // : coun.tojson(data: co).toList();
      print(kom.length);
      return kom;
    }
  }
}
