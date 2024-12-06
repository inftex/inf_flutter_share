// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/to/pubspec-plugin-platforms.

import 'inf_flutter_share_platform_interface.dart';

export 'share_manager_abstract.dart';
export 'share_manager_impl.dart';
export 'share_result.dart';

class InfFlutterShare {
  Future<String?> getPlatformVersion() {
    return InfFlutterSharePlatform.instance.getPlatformVersion();
  }
}
