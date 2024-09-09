import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class QuoteRepository {
  static String url = "https://api.whatdoestrumpthink.com/api/v1/quotes/random";
  static Future<String> get() async {
    final response = await http.get(Uri.parse(url));
    final data = convert.jsonDecode(response.body);
    return data["message"];
  }
}
