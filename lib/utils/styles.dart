import 'package:flutter/material.dart';


const interLight = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w300,
);

const interRegular = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
);

const interMedium = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w500,
);


const interSemiBold = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w600,
);

const interBold = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w700,
);




// class ThemeShadow {
//   static List <BoxShadow> getShadow(BuildContext context) {
//     List<BoxShadow> boxShadow =  [BoxShadow(color: Provider.of<ThemeController>(context, listen: false).darkTheme? Colors.black26:
//     Theme.of(context).primaryColor.withOpacity(.075), blurRadius: 5,spreadRadius: 1,offset: const Offset(1,1))];
//     return boxShadow;
//   }
// }