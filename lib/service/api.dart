// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:websearch/model/searchmodel.dart';


  Future<Search> getapiposted(String query) async {
    String url =
        "https://google-search72.p.rapidapi.com/search?lr=lang_en&start=0&num=10&q=$query&gl=us&rapidapi-key=ea3d193a8dmsh634a7991caff0ddp12b074jsn0999d3882f44";
    final respone = await http.get(Uri.parse(url));
    if (respone.statusCode == 200) {
      var data = searchFromJson(respone.body);
      print("${data}sucessfully data showed");

      return data;
    } else {
      throw ("is empty");
    }
  }
