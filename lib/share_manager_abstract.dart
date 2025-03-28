import 'package:flutter/widgets.dart';
import 'package:inf_flutter_share/inf_flutter_share.dart';

///
///
/// "App name
/// Android: https://play.google.com/store/apps/details?id=$appId
/// iOS: https://apps.apple.com/app/id$appId"
///
///
abstract class Share {
  static Share? _instance;

  static Share get I {
    _instance ??= ShareImpl();
    return _instance!;
  }

  ///
  /// !!!IMPORTANT on iPad: create Builder() for context
  ///
  Future<ShareResult> share({
    required BuildContext context,
    required String content,
  });

  ///
  /// !!!IMPORTANT on iPad: create Builder() for context
  ///
  Future<ShareResult> shareFile({
    required BuildContext context,
    required String filePath,
    required String content,
  });

  ///
  /// Default button with share()
  ///
  /* 
  Share.I.defaultButton(
    title: 'Share with your friend',
    // backgroundColor: Colors.yellow,
    // iconColor: Colors.red,
    // textStyle: TextStyle(color: Colors.red),
    onClick: (context) {
      Share.I.share(context, 'hello link');
    })
  */
  Widget defaultButton({
    required String title,
    required Function(BuildContext context) onClick,
    Color? backgroundColor,
    Color? iconColor,
    TextStyle? textStyle,
  });
}
