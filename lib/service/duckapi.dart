

import 'package:dio/dio.dart';
import 'package:websearch/model/duckmodel.dart';

Future<Duc> getduckduck(String query) async {

 Dio dio = Dio();

  String url = "https://duckduckgo8.p.rapidapi.com/";
  final response = await dio.get(
    url,
    queryParameters: {'q': query},
    options: Options(headers: {
      'X-RapidAPI-Key': 'ea3d193a8dmsh634a7991caff0ddp12b074jsn0999d3882f44',
      'X-RapidAPI-Host': 'duckduckgo8.p.rapidapi.com'
    }),
  );
  
  if (response.statusCode == 200) {
    var data = Duc.fromJson(response.data);
    print("Success duckduckgo: $data");
    return data;
  } else {
    throw Exception("Response is empty");
  }
}
