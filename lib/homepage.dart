import 'package:enjoyjakarta/login_screen.dart';
import 'package:enjoyjakarta/splashscreen.dart';
import 'package:enjoyjakarta/theme_setup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'responsiver.dart';

class Homepage extends StatefulWidget {
  final String title;
  const Homepage({Key? key, required this.title}) : super(key: key);

  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> with TickerProviderStateMixin {
  bool collapsedTitle = false;
  String searchValue = '';

  bool isMenuTap = false;
  late AnimationController menuAnimationCtrl;
  Color menuIcon = themeSetup.black;
  Color menuButton = themeSetup.white;

  @override
  void initState() {
    menuAnimationCtrl = AnimationController(
      duration: const Duration(seconds: 0, milliseconds: 200),
      vsync: this,
      reverseDuration: const Duration(seconds: 0, milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    menuAnimationCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final double stebPadding = resp.responsiverw(width, 20);
    final double searchBarHeight = resp.responsiver(height, 46);

    List<Widget> generateButton(int count) {
      List<Widget> items = [];
      for (int i = 0; i < count; i++) {
        items.add(buildButton(i, height, width));
      }
      return items;
    }

    return Scaffold(
      backgroundColor: themeSetup.bgColor,
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Visibility(
                  child: Text("Selamat Pagi, Han Vito"), visible: false),
              titleTextStyle: TextStyle(
                color: themeSetup.white,
                fontFamily: "Plus Jakarta",
                fontWeight: FontWeight.w500,
                fontSize: resp.responsiver(height, 16),
              ),
              pinned: true,
              backgroundColor: themeSetup.bgColor,
              elevation: 0,
              automaticallyImplyLeading: false,
              actions: [
                SizedBox(
                  height: resp.responsiver(height, 32),
                  width: resp.responsiver(height, 32),
                  child: FloatingActionButton(
                    backgroundColor: themeSetup.white,
                    onPressed: () {},
                    child: Icon(
                      Icons.headset_outlined,
                      size: resp.responsiver(height, 16),
                      color: themeSetup.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: resp.responsiverw(width, 10),
                ),
                SizedBox(
                  height: resp.responsiver(height, 32),
                  width: resp.responsiver(height, 32),
                  child: FloatingActionButton(
                    backgroundColor: themeSetup.white,
                    onPressed: () {},
                    child: Icon(
                      Icons.notifications_outlined,
                      size: resp.responsiver(height, 16),
                      color: themeSetup.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: resp.responsiverw(width, 10),
                ),
                SizedBox(
                  height: resp.responsiver(height, 32),
                  width: resp.responsiver(height, 32),
                  child: FloatingActionButton(
                    backgroundColor: menuButton,
                    onPressed: () {
                      if (isMenuTap == false) {
                        isMenuTap = true;
                        menuIcon = themeSetup.white;
                        menuButton = themeSetup.alertColor;
                        setState(() {
                          menuAnimationCtrl.forward();
                        });
                      } else {
                        isMenuTap = false;
                        menuIcon = themeSetup.black;
                        menuButton = themeSetup.white;
                        setState(
                          () {
                            menuAnimationCtrl.reverse();
                          },
                        );
                      }
                    },
                    child: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: menuAnimationCtrl,
                      size: resp.responsiver(height, 16),
                      color: menuIcon,
                    ),
                  ),
                ),
                SizedBox(
                  width: stebPadding,
                )
              ],
              expandedHeight: resp.responsiver(height, 273),
              flexibleSpace: Stack(
                children: <Widget>[
                  Positioned.fill(
                    bottom: searchBarHeight / 2,
                    child: Image.asset(
                      "assets/images/homepic.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: resp.responsiver(height, 273),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: stebPadding,
                        right: resp.responsiverw(width, 130),
                        bottom: resp.responsiver(height, 30),
                      ),
                      child: ListView(
                        children: [
                          SizedBox(
                            height: resp.responsiver(height, 80),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  "Selamat Pagi, Han Vito",
                                  style: TextStyle(
                                    color: themeSetup.white,
                                    fontFamily: "Plus Jakarta",
                                    fontWeight: FontWeight.w500,
                                    fontSize: resp.responsiver(height, 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: resp.responsiver(height, 15),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  "Explore The Beauty of Journey in Jakarta.",
                                  style: TextStyle(
                                    color: themeSetup.white,
                                    fontFamily: "Plus Jakarta",
                                    fontWeight: FontWeight.w300,
                                    fontSize: resp.responsiver(height, 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              bottom: PreferredSize(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: stebPadding,
                    right: stebPadding,
                  ),
                  child: SizedBox(
                    height: searchBarHeight,
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: "Cari destinasi wisata...",
                          hintStyle: TextStyle(
                            color: themeSetup.secondaryTextColor,
                            fontFamily: "Plus Jakarta",
                            fontWeight: FontWeight.w300,
                            fontSize: resp.responsiver(height, 13),
                          ),
                          filled: true,
                          fillColor: themeSetup.white,
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: themeSetup.black,
                        ),
                      ),
                    ),
                  ),
                ),
                preferredSize: Size.fromHeight(
                  resp.responsiver(height, 51),
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.only(
              left: resp.responsiverw(width, 10),
              right: resp.responsiverw(width, 10),
              top: resp.responsiver(height, 20)),
          child: ListView(
            children: [
              Wrap(
                children: generateButton(10),
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.start,
                spacing: resp.responsiverw(width, 20),
                runSpacing: resp.responsiver(height, 15),
              ),
              SizedBox(
                height: resp.responsiver(height, 15),
              ),
              buildContentTitle("Travel News", height, width),
              buildContentTitle("Wisata Terdekat", height, width),
              buildContentTitle("Wisata Kawasan", height, width),
              buildContentTitle("Event", height, width),
              buildContentTitle("Konversi Mata Uang", height, width),
              buildContentTitle("Hashgram", height, width),
            ],
          ),
        ),
      ),
    );
  }

  Map categoryIcon = {
    "Alam": Icons.landscape,
    "Belanja": Icons.shopping_cart,
    "Olahraga": FontAwesomeIcons.personRunning,
    "Religi": FontAwesomeIcons.handHoldingHeart,
    "Sejarah": Icons.temple_hindu,
    "Kuliner": Icons.restaurant,
    "Arsitektur": FontAwesomeIcons.monument,
    "Budaya": FontAwesomeIcons.masksTheater,
    "MICE": Icons.confirmation_num,
    "Rekreasi": Icons.attractions,
  };

  Map categoryIndex = {
    "Alam": 0,
    "Belanja": 1,
    "Olahraga": 2,
    "Religi": 3,
    "Sejarah": 4,
    "Kuliner": 5,
    "Arsitektur": 6,
    "Budaya": 7,
    "MICE": 8,
    "Rekreasi": 9,
  };

  Map categoryColor = {
    "Alam": themeSetup.alam,
    "Belanja": themeSetup.belanja,
    "Olahraga": themeSetup.olahraga,
    "Religi": themeSetup.religi,
    "Sejarah": themeSetup.sejarah,
    "Kuliner": themeSetup.kuliner,
    "Arsitektur": themeSetup.arsitektur,
    "Budaya": themeSetup.budaya,
    "MICE": themeSetup.mice,
    "Rekreasi": themeSetup.rekreasi,
  };

  getCategoryButton(index, data) {
    var label = categoryIndex.entries.firstWhere((e) => e.value == index).key;

    if (data == "label") {
      return label;
    } else if (data == "icon") {
      return categoryIcon.entries.firstWhere((e) => e.key == label).value;
    } else if (data == "color") {
      return categoryColor.entries.firstWhere((e) => e.key == label).value;
    }
  }

  buildButton(index, height, width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Icon(
            getCategoryButton(index, "icon"),
            size: resp.responsiver(height, 20),
            color: themeSetup.white,
          ),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: Size.square(
              resp.responsiver(height, 50),
            ),
            backgroundColor: Color(getCategoryButton(index, "color")),
            shape: const CircleBorder(),
          ),
        ),
        SizedBox(
          height: resp.responsiver(height, 5),
        ),
        Text(
          getCategoryButton(index, "label"),
          style: TextStyle(
            color: themeSetup.black,
            fontFamily: "Plus Jakarta",
            fontWeight: FontWeight.w400,
            fontSize: resp.responsiver(height, 12),
          ),
        )
      ],
    );
  }

  buildContentTitle(txt, height, width) {
    return Padding(
      padding: EdgeInsets.all(resp.responsiverw(width, 10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              txt,
              style: TextStyle(
                color: themeSetup.black,
                fontFamily: "Plus Jakarta",
                fontWeight: FontWeight.w700,
                fontSize: resp.responsiver(height, 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
