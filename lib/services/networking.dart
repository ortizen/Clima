import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkHelper {
  NetworkHelper(this._url);

  final String _url;

  Future getData() async {
    var response = await http.get(_url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
    return response;
  }
}
