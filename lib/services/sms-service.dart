import 'package:smsforwarder/config/constant.dart';
import 'package:smsforwarder/plugin/dio.dart';

class SmsService {

  static Future<void> forward(Map<String, dynamic> map) async {
    try {
      String url = '${Constant.apiUrl}message';
      await http.post(url, data: map);
    } catch (e) {
    }
  }
}
