import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'inf_flutter_share_method_channel.dart';

abstract class InfFlutterSharePlatform extends PlatformInterface {
  /// Constructs a InfFlutterSharePlatform.
  InfFlutterSharePlatform() : super(token: _token);

  static final Object _token = Object();

  static InfFlutterSharePlatform _instance = MethodChannelInfFlutterShare();

  /// The default instance of [InfFlutterSharePlatform] to use.
  ///
  /// Defaults to [MethodChannelInfFlutterShare].
  static InfFlutterSharePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InfFlutterSharePlatform] when
  /// they register themselves.
  static set instance(InfFlutterSharePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
