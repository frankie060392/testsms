import 'package:smsforwarder/config/constant.dart';
import 'package:smsforwarder/plugin/dio.dart';

class SmsService {

  static Future<void> forward(String map) async {
    try {
      String url = Constant.telegramBotApi + Uri.encodeComponent(map.toString());
      http.get(url);
      print(url);
    } catch (e) {
      print(e);
    }
  }
}
