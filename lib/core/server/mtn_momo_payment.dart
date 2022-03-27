import 'package:http/http.dart' as http;

class MTNMomoPayment {
  Future? createAPIUser() async {
    http.Response response = await http.post(
        Uri.parse('https://api.momo.vn/gw/rest/token/getToken'),
        headers: {
          'Content-Type': 'application/json',
        });
  }

  Future sendMomoRequest({
    required String phoneNumber,
    required String amount,
  }) async {
    http.Response response = await http.post(
        Uri.parse("https://api.momo.vn/gw/rest/token/getToken"),
        headers: {
          "Content-Type": "application/json",
        });
  }
}
