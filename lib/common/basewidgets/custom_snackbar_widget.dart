import 'package:flutter/material.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:get/get.dart';

void showCustomSnackBarWidget(String? message, {bool isError = true}) {
  Get.showSnackbar(GetSnackBar(
    backgroundColor: isError ? Colors.red : Colors.green,
    message: message,
    duration: const Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    margin:  const EdgeInsets.all(Dimensions.paddingSizeSmall),
    borderRadius: 10,
    isDismissible: true,
  ));
}