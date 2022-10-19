import 'package:enjoyjakarta/login_screen.dart';
import 'package:enjoyjakarta/splashscreen.dart';
import 'package:enjoyjakarta/theme_setup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'responsiver.dart';

class Profile extends StatefulWidget {
  final String title;
  const Profile({Key? key, required this.title}) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text(widget.title)],
      ),
    );
  }
}
