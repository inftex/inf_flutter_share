import 'package:flutter/material.dart';
import 'package:inf_flutter_share/inf_flutter_share.dart';
import 'package:share_plus/share_plus.dart' as sp;

class ShareImpl extends Share {
  ShareImpl();

  @override
  Future<ShareResult> share(String content) async {
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

  @override
  Widget defaultButton({
    required String title,
    required Function onClick,
    Color? backgroundColor,
    Color? iconColor,
    TextStyle? textStyle,
  }) {
    return InkWell(
      onTap: () {
        onClick.call();
      },
      splashColor: null,
      highlightColor: null,
      focusColor: null,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.blue,
          // border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.share,
              color: iconColor ?? Colors.white,
              size: 24,
            ),
            const SizedBox(width: 4),
            Text(
              title,
              style: textStyle ??
                  const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
