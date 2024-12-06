import 'package:inf_flutter_share/inf_flutter_share.dart';
import 'package:share_plus/share_plus.dart' as sp;

class ShareImpl extends Share {
  ShareImpl();

  @override
  Future<ShareResult> share({required String content}) async {
    final result = await sp.Share.share(content);
    return _convertToResult(result.status);
  }

  ShareResult _convertToResult(sp.ShareResultStatus status) {
    ShareResult result = ShareResult.error;
    if (status == sp.ShareResultStatus.success) {
      result = ShareResult.success;
    }
    return result;
  }
}
