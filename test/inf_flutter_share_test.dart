import 'package:flutter_test/flutter_test.dart';
import 'package:inf_flutter_share/inf_flutter_share.dart';
import 'package:inf_flutter_share/inf_flutter_share_platform_interface.dart';
import 'package:inf_flutter_share/inf_flutter_share_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInfFlutterSharePlatform
    with MockPlatformInterfaceMixin
    implements InfFlutterSharePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final InfFlutterSharePlatform initialPlatform = InfFlutterSharePlatform.instance;

  test('$MethodChannelInfFlutterShare is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInfFlutterShare>());
  });

  test('getPlatformVersion', () async {
    InfFlutterShare infFlutterSharePlugin = InfFlutterShare();
    MockInfFlutterSharePlatform fakePlatform = MockInfFlutterSharePlatform();
    InfFlutterSharePlatform.instance = fakePlatform;

    expect(await infFlutterSharePlugin.getPlatformVersion(), '42');
  });
}
