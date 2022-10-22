import 'package:enjoyjakarta/login_screen.dart';
import 'package:enjoyjakarta/splashscreen.dart';
import 'package:enjoyjakarta/theme_setup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'responsiver.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Maps extends StatefulWidget {
  final String title;
  const Maps({Key? key, required this.title}) : super(key: key);

  @override
  State<Maps> createState() => _Maps();
}

class _Maps extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return FlutterMap(
      options: MapOptions(
        center: LatLng(-6.173771651940657, 106.82713505856334),
        zoom: 15,
        onMapReady: () => print("ready"),
      ),
      nonRotatedChildren: [
        SizedBox(
          height: resp.responsiver(height, 50),
          width: resp.responsiver(height, 50),
          child: FloatingActionButton(
            heroTag: UniqueKey(),
            backgroundColor: themeSetup.white,
            onPressed: () {},
            child: Icon(
              Icons.north_rounded,
              size: resp.responsiver(height, 25),
              color: themeSetup.black,
            ),
          ),
        ),
        AttributionWidget.defaultWidget(
          source: 'OpenStreetMap contributors',
          onSourceTapped: null,
        ),
      ],
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.enjoyjakarta.app',
        ),
      ],
    );
  }
}
