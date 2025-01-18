import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_group_flutter/app/modules/home/views/home_view.dart';

class DashboardController extends GetxController {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeView(),
    const Center(
      child: Text('Favorite Page \nSabar dlu yahhhh'),
    ),
    const Center(
      child: Text('Ini ganti jadi profile aja yaaak'),
    ),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}
