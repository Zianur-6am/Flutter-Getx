import 'package:flutter/material.dart';
import 'package:flutter_getx/Internationalization/ihome.dart';
import 'package:flutter_getx/Internationalization/messages.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/screens/add_product_screen.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/screens/valley_home_screen.dart';
import 'package:flutter_getx/explore_screen.dart';
import 'package:flutter_getx/fetchapidata/productmodule/views/product_list_view.dart';
import 'package:flutter_getx/route_navigation/named_navigation/route_home.dart';
import 'package:flutter_getx/route_navigation/named_navigation/screen1.dart';
import 'package:flutter_getx/route_navigation/named_navigation/screen2.dart';
import 'package:flutter_getx/route_navigation/named_navigation/unknown_route.dart';
import 'package:flutter_getx/route_navigation/un_named_navigation/page1.dart';
import 'package:flutter_getx/state_management/reactive_state_manager/reactive_sm.dart';
import 'package:flutter_getx/state_management/simple_state_manager/simple_sm.dart';
import 'package:flutter_getx/tab_bar/screens/blog_screen.dart';
import 'package:flutter_getx/theme/controllers/theme_controller.dart';
import 'package:flutter_getx/theme/light_theme.dart';
import 'package:flutter_getx/widgets/bottom_sheet.dart';
import 'package:flutter_getx/widgets/expantion_tile.dart';
import 'package:flutter_getx/widgets/show_dialog.dart';
import 'package:flutter_getx/widgets/snackbar.dart';
import 'package:get/get.dart';

import 'Food_Delivery_App_Design/features/home/screens/bottom_nav_bar.dart';
import 'home.dart';
import 'theme/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (themeController) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // title: 'Snackbar',
          theme: themeController.darkTheme ? dark : light,


          ///Routing

          // //to use unknownroute initialRoute cannot be /
          // initialRoute: '/home',
          //default transition for all routes
          defaultTransition: Transition.fadeIn,
          //defining the routes of the pages
          getPages: [
            GetPage(name: '/home', page: () => const Home()),
            GetPage(
                name: '/named_route_home',
                page: () => const RouteHomeClass(),
                //overrides the default transition for this particular route
                transition: Transition.leftToRight,
            ),
            GetPage(name: '/snackbar', page: () => const SnackbarClass()),
            GetPage(name: '/dialog', page: () => const ShowDialogClass()),
            GetPage(name: '/bottomsheet', page: () => const BottomSheetClass()),
            GetPage(name: '/unnamed_route', page: () => const Page1Class()),
            GetPage(name: '/screen1', page: () => const Screen1Class()),
            GetPage(name: '/screen2', page: () => const Screen2Class()),
            GetPage(name: '/rsm', page: () => ReactiveSMClass()),
            GetPage(name: '/ssm', page: () => SimpleSMClass()),
            GetPage(name: '/ihome', page: () => Ihome()),
            GetPage(name: '/plv', page: () => ProductListView()),
            GetPage(name: '/fdhome', page: () => BottomNavBar()),
            GetPage(name: '/exptl', page: () => const ExpantionTileExample()),
            GetPage(name: '/blog_screen', page: () => const BlogScreen()),
            GetPage(name: '/add_product', page: () => const AddProductScreen()),
            GetPage(name: '/valley_home', page: () => const ValleyHomeScreen()),
            // GetPage(name: '/explore', page: () => PaginationWithTabs()),
          ],
          //to use unknownroute initialRoute cannot be /
          unknownRoute: GetPage(name: '/notfound', page: () => const UnknownRoute()),



          ///Internationalization
          translations: Messages(), //your translation class
          locale: const Locale('en', 'US'),//default locale //to get device locale Get.deviceLocale()
          fallbackLocale: const Locale('en', 'US'),
          home: const Home(),
        );
      }
    );
  }
}

