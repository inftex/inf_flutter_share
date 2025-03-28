import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:inf_flutter_share/inf_flutter_share.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _infFlutterSharePlugin = InfFlutterShare();

  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _infFlutterSharePlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $_platformVersion\n'),
              Share.I.defaultButton(
                  title: 'Share with your friend',
                  // backgroundColor: Colors.yellow,
                  // iconColor: Colors.red,
                  // textStyle: TextStyle(color: Colors.red),
                  onClick: (context) {
                    Share.I.share(
                      context: context,
                      content: 'hello link',
                    );
                  }),
              SizedBox(height: 30),
              Share.I.defaultButton(
                  title: 'Share file',
                  // backgroundColor: Colors.yellow,
                  // iconColor: Colors.red,
                  // textStyle: TextStyle(color: Colors.red),
                  onClick: (context) {
                    Share.I.shareFile(
                      context: context,
                      filePath: 'abc.pnj',
                      content: 'hello link',
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
