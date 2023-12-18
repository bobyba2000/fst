import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingUtility {
  static Future<void> show() {
    return EasyLoading.show();
  }

  static Future<void> dismiss() {
    return EasyLoading.dismiss();
  }
}
