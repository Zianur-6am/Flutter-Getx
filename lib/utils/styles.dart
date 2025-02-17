import 'package:flutter/material.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:get/get.dart';


const titilliumRegular = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault,
);


const titilliumSemiBold = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: Dimensions.fontSizeLarge,
  fontWeight: FontWeight.w500,
);

const titilliumBold = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w600,
);
const titilliumItalic = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: Dimensions.fontSizeDefault,
  fontStyle: FontStyle.italic,
);

const robotoHintRegular = TextStyle(
    fontFamily: 'Ubuntu',
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.fontSizeSmall,
    color: Colors.grey
);
const robotoRegular = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault,
);
const robotoRegularMainHeadingAddProduct = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault,
);

const robotoRegularForAddProductHeading = TextStyle(
  fontFamily: 'Ubuntu',
  color: Color(0xFF9D9D9D),
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeSmall,
);

const robotoTitleRegular = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeLarge,
);

const robotoSmallTitleRegular = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeSmall,
);

const robotoBold = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w600,
);

const robotoMedium = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w500,
);


class ThemeShadow {
  static List <BoxShadow> getShadow(BuildContext context) {
    List<BoxShadow> boxShadow =  [BoxShadow(color: Get.isDarkMode ? Colors.black26:
    Theme.of(context).primaryColor.withValues(alpha:.075), blurRadius: 5,spreadRadius: 1,offset: const Offset(1,1))];
    return boxShadow;
  }
}
