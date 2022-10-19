import 'package:enjoyjakarta/homepage.dart';
import 'package:enjoyjakarta/login_screen.dart';
import 'package:enjoyjakarta/maps.dart';
import 'package:enjoyjakarta/profile.dart';
import 'package:enjoyjakarta/saved.dart';
import 'package:enjoyjakarta/splashscreen.dart';
import 'package:enjoyjakarta/theme_setup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'responsiver.dart';

class BottomNavCtrl extends StatefulWidget {
  final String title;
  const BottomNavCtrl({Key? key, required this.title}) : super(key: key);

  @override
  State<BottomNavCtrl> createState() => _BottomNavCtrl();
}

class _BottomNavCtrl extends State<BottomNavCtrl> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final double stebPadding = resp.responsiverw(width, 20);
    PersistentTabController _controller =
        PersistentTabController(initialIndex: 0);

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.home,
            size: resp.responsiver(height, 35),
          ),
          title: "Home",
          activeColorPrimary: themeSetup.accentColor,
          inactiveColorPrimary: themeSetup.gray,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.location_on,
            size: resp.responsiver(height, 35),
          ),
          title: "Maps",
          activeColorPrimary: themeSetup.accentColor,
          inactiveColorPrimary: themeSetup.gray,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.bookmark,
            size: resp.responsiver(height, 35),
          ),
          title: "Saved",
          activeColorPrimary: themeSetup.accentColor,
          inactiveColorPrimary: themeSetup.gray,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.person,
            size: resp.responsiver(height, 35),
          ),
          title: "Profile",
          activeColorPrimary: themeSetup.accentColor,
          inactiveColorPrimary: themeSetup.gray,
        ),
      ];
    }

    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style12,
      navBarHeight: resp.responsiver(height, 62),
    );
  }

  List<Widget> _buildScreens() {
    return [
      Homepage(title: "Homepage"),
      Maps(title: "Maps"),
      Saved(title: "Saved"),
      Profile(title: "Profile")
    ];
  }
}
