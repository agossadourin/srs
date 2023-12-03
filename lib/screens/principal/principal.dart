import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srs/screens/page_a/page_a.dart';
import 'package:srs/screens/page_b/page_b.dart';
import 'package:srs/screens/page_c/page_c.dart';

import '../../controllers/nav_controller.dart';

class Principal extends StatelessWidget {
  final NavController navController = Get.put(NavController());

  Principal({super.key});

  final List<String> titles = [
    'Accueil',
    'Services',
    'Ma voiture',
    'chatBot',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Obx(() => Text(
              titles[navController.selectedIndex.value],
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            )),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        // make AppBar background transparent
        elevation: 5,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Image(
                image: AssetImage('assets/icons/Notifications.png')),
          )
        ],
      ),
      body: Obx(() {
        switch (navController.selectedIndex.value) {
          case 0:
            return const PageA();
          case 1:
            return PageB();
          case 2:
            return PageC();
          case 3:
            return Container(child: Center(child: Text('Page 4')));
          default:
            return Container();
        }
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            useLegacyColorScheme: false,
            fixedColor: Colors.white,
            currentIndex: navController.selectedIndex.value,
            onTap: (index) => navController.changeIndex(index),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Acceuil',
                  backgroundColor: Colors.blueGrey),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Services',
                  backgroundColor: Colors.blueGrey),
              BottomNavigationBarItem(
                icon: Icon(Icons.car_rental),
                label: 'Ma voiture',
                backgroundColor: Colors.blueGrey,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
                backgroundColor: Colors.blueGrey,
              ),
            ],
          )),
    );
  }
}
