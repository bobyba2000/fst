import 'package:flutter/widgets.dart';

extension NumExtension on double {
  Widget get hSpace => SizedBox(
        height: this,
      );
  Widget get wSpace => SizedBox(
        width: this,
      );
}
