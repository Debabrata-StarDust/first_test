import 'package:first_test/view/bottom_navbar/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/bottom_navbar_controller/bottom_navbar_controller.dart';
import 'home.dart';

class BottomNavBar extends GetView<BottomNavBarController> {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavBarController());
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            HomePage(),
            Search(),
            Center(child: Text("data3")),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(50),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              elevation: 0.0,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black45,
              currentIndex: controller.currentIndex.value,
              onTap: controller.changeBottomTabIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    activeIcon: Icon(Icons.home),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    activeIcon: Icon(Icons.search),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_2_outlined),
                    activeIcon: Icon(Icons.person_2_outlined),
                    label: "")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
