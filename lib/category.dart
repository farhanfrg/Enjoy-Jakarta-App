import 'package:enjoyjakarta/login_screen.dart';
import 'package:enjoyjakarta/splashscreen.dart';
import 'package:enjoyjakarta/theme_setup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'responsiver.dart';

class Category extends StatefulWidget {
  final String title;
  final Color color;
  final String header;
  final bool backButton;
  final bool searchBar;
  const Category(
      {Key? key,
      required this.title,
      required this.color,
      required this.header,
      required this.backButton,
      required this.searchBar})
      : super(key: key);

  @override
  State<Category> createState() => _Category();
}

class _Category extends State<Category> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final double stebPadding = resp.responsiverw(width, 20);
    final double searchBarHeight = resp.responsiver(height, 46);
    final double headerHeight = resp.responsiver(height, 75);

    final String appBarTitle = widget.title;

    return Scaffold(
      backgroundColor: themeSetup.bgColor,
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
          SliverAppBar(
            leading: Visibility(
              visible: widget.backButton,
              child: Padding(
                padding: EdgeInsets.only(
                  left: stebPadding,
                ),
                child: GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: themeSetup.white,
                    size: resp.responsiver(height, 18),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(
                  right: stebPadding,
                ),
                child: Hero(
                  tag: "jakartaPlus",
                  transitionOnUserGestures: true,
                  child: Image.asset(
                    'assets/images/plusJakarta.png',
                    width: resp.responsiver(height, 18),
                    height: resp.responsiver(height, 32),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
            toolbarHeight: headerHeight,
            pinned: true,
            backgroundColor: themeSetup.clear,
            elevation: 0,
            collapsedHeight: headerHeight,
            flexibleSpace: Stack(
              children: <Widget>[
                Positioned.fill(
                  bottom: searchBarHeight / 2,
                  child: SizedBox(
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: widget.color),
                    ),
                  ),
                ),
                if (widget.color == themeSetup.accentColor)
                  Positioned.fill(
                    bottom: searchBarHeight / 2,
                    child: Image.asset(
                      "assets/images/" +
                          widget.header.replaceAll(" ", "") +
                          "_Header.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: widget.searchBar
                              ? searchBarHeight
                              : searchBarHeight / 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            appBarTitle,
                            style: TextStyle(
                              color: themeSetup.white,
                              fontFamily: "Plus Jakarta",
                              fontWeight: FontWeight.w700,
                              fontSize: resp.responsiver(height, 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            bottom: PreferredSize(
              child: Visibility(
                visible: widget.searchBar,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: resp.responsiverw(width, 15),
                    right: resp.responsiverw(width, 15),
                  ),
                  child: SizedBox(
                    height: searchBarHeight,
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: "Cari $appBarTitle...",
                          hintStyle: TextStyle(
                            color: themeSetup.secondaryTextColor,
                            fontFamily: "Plus Jakarta",
                            fontWeight: FontWeight.w300,
                            fontSize: resp.responsiver(height, 15),
                          ),
                          filled: true,
                          fillColor: themeSetup.white,
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: themeSetup.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              preferredSize: Size.fromHeight(
                widget.searchBar
                    ? resp.responsiver(height, 51)
                    : resp.responsiver(height, 29),
              ),
            ),
          ),
        ],
        body: const Text(""),
      ),
    );
  }
}
