import 'package:flutter/material.dart';
import 'package:ppstech/resources/text.dart';
import 'package:ppstech/screen/home/home.dart';
import '../resources/colors.dart';
import '../resources/images.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int tabIndex = 0;

  final List<Widget> contentPages = <Widget>[
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        drawerEnableOpenDragGesture: false,
        body: contentPages.elementAt(tabIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: ColorItems.primary,
          selectedLabelStyle: TextItems.textStyle.copyWith(fontSize: 12),
          showSelectedLabels: true,
          selectedFontSize: 12,
          currentIndex: tabIndex,
          items: [
            BottomNavigationBarItem(
              icon: Images.getImages('icon/nav_home'),
              label: '홈',
            ),
            BottomNavigationBarItem(
                icon: Images.getImages('icon/nav_oval_coin_fill',
                    color: ColorItems.transParent),
                label: ''),
            BottomNavigationBarItem(
                icon: Images.getImages('icon/nav_star',
                    color: ColorItems.transParent),
                label: ''),
            BottomNavigationBarItem(
                icon: Images.getImages('icon/nav_my',
                    color: ColorItems.transParent),
                label: ''),
            BottomNavigationBarItem(
                icon: Images.getImages('icon/home',
                    color: ColorItems.transParent),
                label: ''),
          ],
        ),
      ),
    );
  }
}
