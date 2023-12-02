import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srs/screens/page_a/page_a.dart';
import 'package:srs/screens/splash_screen/page_1.dart';

import '../../controllers/nav_controller.dart';

class Principal extends StatelessWidget {
  final NavController navController = Get.put(NavController());

  Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (navController.selectedIndex.value) {
          case 0:
            return const PageA();
          case 1:
            return Container(child: Center(child: Text('Page 2')));
          case 2:
            return Container(child: Center(child: Text('Page 3')));
          case 3:
            return Container(child: Center(child: Text('Page 4')));
          default:
            return Container();
        }
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            useLegacyColorScheme: false,
            fixedColor: Colors.black,
            currentIndex: navController.selectedIndex.value,
            onTap: (index) => navController.changeIndex(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                  backgroundColor: Colors.blueGrey),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                  backgroundColor: Colors.lightBlue),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          )),
    );
  }
}
