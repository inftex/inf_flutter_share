import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inf_flutter_share/inf_flutter_share_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelInfFlutterShare platform = MethodChannelInfFlutterShare();
  const MethodChannel channel = MethodChannel('inf_flutter_share');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
