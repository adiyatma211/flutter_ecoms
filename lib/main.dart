import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/strings.dart';
import 'package:emart_app/consts/styles.dart';
import 'package:emart_app/views/cart_screen/cart_controller.dart';
// import 'package:emart_app/controllers/cart_controller.dart';
import 'package:emart_app/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ambil token dari shared preferences
  final prefs = await SharedPreferences.getInstance();
  final String token = prefs.getString('token') ?? '';

  // Inisialisasi CartController dengan token
  Get.put(CartController(token));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: darkFontGrey,
          ),
        ),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}
