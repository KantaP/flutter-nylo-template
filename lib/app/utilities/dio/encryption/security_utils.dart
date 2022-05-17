import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class SecurityUtils {
  static const platform =
      MethodChannel('asia.paypay.flutter.dev/check_security');

  Future<void> checkSecurity() async {
    final isSecurity = await platform.invokeMethod('checkSecurity');
    if (isSecurity) {
      // _toastService.showToast(ToastRequest(
      //     msg: "checkSecurity = true", status: ToastStatus.SUCCESS));
    } else {
      // _toastService.showToast(ToastRequest(
      //     msg: "checkSecurity = false", status: ToastStatus.ERROR));
    }
  }
}
