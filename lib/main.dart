import 'package:flutter/material.dart';
import 'package:smsforwarder/services/sms-service.dart';
import 'package:telephony/telephony.dart';

onBackgroundMessage(SmsMessage message) {
  SmsService.forward(message.body ?? "Error reading message body.");
  debugPrint("onBackgroundMessage called");
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message;
  final telephony = Telephony.instance;
  @override
  void initState() {
    super.initState();
    initPlatformState();
    _message = 'waiting';
  }


  _onMessage(SmsMessage message) async {
    setState(() {
      _message = message.body ?? "Error reading message body.";
      print('date' + message.date.toString());
    });
  }

  Future<void> initPlatformState() async {
    final bool result = await telephony.requestPhoneAndSmsPermissions;
    if (result != null && result) {
      telephony.listenIncomingSms(
        onNewMessage: _onMessage,
        onBackgroundMessage: onBackgroundMessage
      );
    }
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sms forwarder'),
      ),
      body: Center(
        child: Text(_message ?? 'None')
      ),
    );
  }
}
