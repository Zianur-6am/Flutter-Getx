import 'dart:developer';

import 'package:flutter_getx/common/basewidgets/custom_snackbar_widget.dart';
import 'package:flutter_getx/data/model/api_response.dart';
import 'package:flutter_getx/data/model/error_response.dart';


class ApiChecker {
  static void checkApi(ApiResponse apiResponse) {
    if(apiResponse.error == "Failed to load data - status code: 401") {
    }else if(apiResponse.response?.statusCode == 500){
      showCustomSnackBarWidget('Internal Server Error');
    }else {
      log("==ff=>${apiResponse.error}");
      String? errorMessage = apiResponse.error.toString();
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = ErrorResponse.fromJson(apiResponse.error);
        log(errorResponse.toString());
        //errorMessage = errorResponse.errors?[0].message;
      }
      showCustomSnackBarWidget(errorMessage);
    }
  }
}