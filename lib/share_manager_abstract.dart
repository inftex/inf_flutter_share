import 'package:flutter/widgets.dart';
import 'package:inf_flutter_share/inf_flutter_share.dart';

abstract class Share {
  static Share? _instance;

  static Share get I {
    _instance ??= ShareImpl();
    return _instance!;
  }

  ///
  /// Create custom share button and call this function on click
  ///
  Future<ShareResult> share(String content);

  ///
  /// Default button with share()
  ///
  /* 
  Share.I.defaultButton(
    title: 'Share with your friend',
    // backgroundColor: Colors.yellow,
    // iconColor: Colors.red,
    // textStyle: TextStyle(color: Colors.red),
    onClick: () {
      Share.I.share('hello link');
    })
  */
  Widget defaultButton({
    required String title,
    required Function onClick,
    Color? backgroundColor,
    Color? iconColor,
    TextStyle? textStyle,
  });
}
