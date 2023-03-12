import 'package:admin_aplication/data/models/latlong/lat_long.dart';
import 'package:admin_aplication/main.dart';
import 'package:admin_aplication/screens/admin/admin_page.dart';
import 'package:admin_aplication/screens/admin/category/add_category_page.dart';
import 'package:admin_aplication/screens/admin/category/show_category_page.dart';
import 'package:admin_aplication/screens/admin/category/update_category_page.dart';
import 'package:admin_aplication/screens/admin/info_store/add_info.dart';
import 'package:admin_aplication/screens/admin/info_store/info_store.dart';
import 'package:admin_aplication/screens/admin/info_store/update_info.dart';
import 'package:admin_aplication/screens/admin/product/add_product_page.dart';
import 'package:admin_aplication/screens/admin/product/show_product.dart';
import 'package:admin_aplication/screens/admin/product/update_product_page.dart';
import 'package:admin_aplication/screens/admin/users/all_users_page.dart';
import 'package:admin_aplication/screens/splash/splash_page.dart';
import 'package:flutter/material.dart';

abstract class RouteName {
  static const splash = 'splash';
  static const main = 'main';
  static const addCategory = 'addCategory';
  static const admin = 'admin';
  static const showCategory = 'showCategory';
  static const updateCategory = 'updateCategory';
  static const showProduct = 'showProduct';
  static const addProduct = 'addProduct';
  static const updateProduct = 'updateProduct';
  static const productInfo = 'productInfo';
  static const allUsers = 'allUsers';
  static const infoStore = 'infoStore';
  static const addInfo = 'addInfo';
  static const updateInfo = 'updateInfo';
  static const map = 'map';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.showCategory:
        return MaterialPageRoute(builder: (_) => ShowCategoryPage());
      case RouteName.main:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => MainPage(
            latLong: args['latLong'],
          ),
        );
      case RouteName.splash:
        return MaterialPageRoute(
          builder: (_) => SplashPage(),
        );
      case RouteName.admin:
        return MaterialPageRoute(
          builder: (_) => AdminPage(
            latLong: settings.arguments as LatLong,
          ),
        );
      case RouteName.addCategory:
        return MaterialPageRoute(
          builder: (_) => AddCategoryPage(),
        );
      case RouteName.showProduct:
        return MaterialPageRoute(
          builder: (_) => ShowProductPage(),
        );
      case RouteName.addProduct:
        return MaterialPageRoute(
          builder: (_) => AddProductPage(),
        );
      case RouteName.allUsers:
        return MaterialPageRoute(
          builder: (_) => AllUsersPage(),
        );
      case RouteName.infoStore:
        return MaterialPageRoute(
          builder: (_) => InfoStorePage(
            latLong: settings.arguments as LatLong,
          ),
        );
      case RouteName.updateInfo:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => UpdateInfoStore(
              infoModel: args['infoModel'], latLong: args['latLong']),
        );
      case RouteName.addInfo:
        return MaterialPageRoute(builder: (_) => AddInfoPage());
      case RouteName.updateProduct:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => UpdateProductPage(
            productModel: args['productItem'],
          ),
        );
      case RouteName.updateCategory:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => UpdateCategoryPage(
            categoryModel: args['categoryItem'],
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
        );
    }
  }
}
