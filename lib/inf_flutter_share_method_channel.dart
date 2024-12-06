import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'inf_flutter_share_platform_interface.dart';

/// An implementation of [InfFlutterSharePlatform] that uses method channels.
class MethodChannelInfFlutterShare extends InfFlutterSharePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('inf_flutter_share');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
