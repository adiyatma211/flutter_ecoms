import 'package:emart_app/controllers/home_controller.dart';
import 'package:emart_app/model/mdlNota.dart';
import 'package:emart_app/views/cart_screen/cart_screen.dart';
import 'package:emart_app/views/cart_screen/invoice_screen.dart';
import 'package:emart_app/views/category_screen/category_scree.dart';
import 'package:emart_app/views/home_screen/home_screen.dart';
import 'package:emart_app/views/cart_screen/invoice_controller.dart';
import 'package:emart_app/views/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(
        icon: Image.asset(
          icHome,
          width: 26,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icCategories,
          width: 26,
        ),
        label: 'Categories',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icCart,
          width: 26,
        ),
        label: 'Cart',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icProfile,
          width: 26,
        ),
        label: 'Invoice',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icProfile,
          width: 26,
        ),
        label: 'Account',
      ),
    ];

    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      CartScreen(),
      InvoiceScreen(), // Menggunakan widget InvoiceScreen
      const ProfileScreen(),
    ];

    return Scaffold(
      body: Obx(() => navBody.elementAt(controller.currentNavIndex
          .value)), // Menggunakan Obx untuk sinkronisasi perubahan di bottom navigation
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: blueColor,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          items: navbarItem,
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
