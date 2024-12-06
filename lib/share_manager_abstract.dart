import 'package:inf_flutter_share/inf_flutter_share.dart';

abstract class Share {
  static Share? _instance;

  static Share get I {
    _instance ??= ShareImpl();
    return _instance!;
  }

  Future<ShareResult> share({required String content});
}
