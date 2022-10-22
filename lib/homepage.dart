import 'package:enjoyjakarta/category.dart';
import 'package:enjoyjakarta/theme_setup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:measure_size/measure_size.dart';
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
  Color menuIcon = themeSetup.mainTextColor;
  Color menuButton = themeSetup.white;

  bool isPinned = false;

  bool isAudioPlayed = false;

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
    final double hideHeaderText = resp.responsiver(height, 220);

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
        physics: const ClampingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
          SliverAppBar(
            title: AnimatedOpacity(
              opacity: isPinned ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: const Text("Selamat Pagi, Han Vito"),
            ),
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
                  heroTag: UniqueKey(),
                  backgroundColor: themeSetup.white,
                  onPressed: () {
                    setState(() {
                      isAudioPlayed = !isAudioPlayed;
                    });
                  },
                  child: Icon(
                    isAudioPlayed ? Icons.stop : Icons.headset_outlined,
                    size: resp.responsiver(height, 16),
                    color: themeSetup.mainTextColor,
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
                  heroTag: UniqueKey(),
                  backgroundColor: themeSetup.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Category(
                            title: "Notifikasi",
                            color: themeSetup.accentColor,
                            backButton: true),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.notifications_outlined,
                    size: resp.responsiver(height, 16),
                    color: themeSetup.mainTextColor,
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
                  heroTag: UniqueKey(),
                  backgroundColor: menuButton,
                  onPressed: () {
                    if (isMenuTap == false) {
                      isMenuTap = true;
                      menuIcon = themeSetup.white;
                      menuButton = themeSetup.alertColor;
                      setState(
                        () {
                          menuAnimationCtrl.forward();
                        },
                      );
                    } else {
                      isMenuTap = false;
                      menuIcon = themeSetup.mainTextColor;
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
                    color: const Color.fromARGB(80, 0, 0, 0),
                    colorBlendMode: BlendMode.softLight,
                  ),
                ),
                LayoutBuilder(
                  builder: (context, p1) => MeasureSize(
                    onChange: (size) {
                      setState(
                        () {
                          if (context.size!.height < hideHeaderText) {
                            isPinned = true;
                          } else {
                            isPinned = false;
                          }
                        },
                      );
                    },
                    child: AnimatedOpacity(
                      opacity: isPinned ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: stebPadding,
                          right: resp.responsiverw(width, 130),
                          bottom: searchBarHeight,
                        ),
                        child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: resp.responsiver(height, 20),
                                  ),
                                  Image.asset(
                                    'assets/images/plusJakarta.png',
                                    width: resp.responsiverw(width, 28),
                                    height: resp.responsiver(height, 55),
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                    height: resp.responsiver(height, 10),
                                  ),
                                  Text(
                                    "Selamat Pagi, Han Vito",
                                    style: TextStyle(
                                      color: themeSetup.white,
                                      fontFamily: "Plus Jakarta",
                                      fontWeight: FontWeight.w500,
                                      fontSize: resp.responsiver(height, 16),
                                    ),
                                  ),
                                  SizedBox(
                                    height: resp.responsiver(height, 15),
                                  ),
                                  Text(
                                    "Explore The Beauty of Journey in Jakarta.",
                                    style: TextStyle(
                                      color: themeSetup.white,
                                      fontFamily: "Plus Jakarta",
                                      fontWeight: FontWeight.w300,
                                      fontSize: resp.responsiver(height, 16),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                )
              ],
            ),
            bottom: PreferredSize(
              child: Padding(
                padding: EdgeInsets.only(
                  left: resp.responsiverw(width, 15),
                  right: resp.responsiverw(width, 15),
                ),
                child: Container(
                  alignment: Alignment.center,
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
                        hintText: "Cari destinasi wisata...",
                        hintStyle: TextStyle(
                          color: themeSetup.secondaryTextColor,
                          fontFamily: "Plus Jakarta",
                          fontWeight: FontWeight.w300,
                          fontSize: resp.responsiver(height, 12),
                        ),
                        filled: true,
                        fillColor: themeSetup.white,
                        prefixIcon: const Icon(Icons.search),
                        prefixIconColor: themeSetup.mainTextColor,
                      ),
                    ),
                  ),
                ),
              ),
              preferredSize: Size.fromHeight(
                searchBarHeight,
              ),
            ),
          ),
        ],
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: resp.responsiver(height, 20),
                right: resp.responsiverw(width, 20),
                left: resp.responsiverw(width, 20),
              ),
              child: Wrap(
                children: generateButton(10),
                alignment: WrapAlignment.spaceBetween,
                runAlignment: WrapAlignment.start,
                spacing: resp.responsiverw(width, 15),
                runSpacing: resp.responsiver(height, 15),
              ),
            ),
            SizedBox(
              height: resp.responsiver(height, 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: resp.responsiver(height, 20),
                right: stebPadding,
                left: stebPadding,
              ),
              child: Card(
                color: themeSetup.clear,
                surfaceTintColor: themeSetup.clear,
                shadowColor: themeSetup.clear,
                child: Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: resp.responsiver(height, 136),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        colors: [
                          themeSetup.bgColor,
                          Color(0xffD2ECFB),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: EdgeInsets.all(stebPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sabtu, 22 Agustus 2022",
                              style: TextStyle(
                                color: themeSetup.mainTextColor,
                                fontFamily: "Plus Jakarta",
                                fontWeight: FontWeight.w500,
                                fontSize: resp.responsiver(height, 12),
                              ),
                            ),
                            Text(
                              "29°C",
                              style: TextStyle(
                                color: themeSetup.mainTextColor,
                                fontFamily: "Plus Jakarta",
                                fontWeight: FontWeight.w700,
                                fontSize: resp.responsiver(height, 46),
                              ),
                            ),
                            Text(
                              "Jakarta Utara",
                              style: TextStyle(
                                color: themeSetup.mainTextColor,
                                fontFamily: "Plus Jakarta",
                                fontWeight: FontWeight.w500,
                                fontSize: resp.responsiver(height, 12),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              "assets/images/cuaca.png",
                              height: resp.responsiver(height, 66),
                              width: resp.responsiver(height, 86),
                              fit: BoxFit.fill,
                            ),
                            Text(
                              "Sedang Berawan",
                              style: TextStyle(
                                color: themeSetup.mainTextColor,
                                fontFamily: "Plus Jakarta",
                                fontWeight: FontWeight.w500,
                                fontSize: resp.responsiver(height, 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            buildContentTitle("Travel News", height, width, true),
            Padding(
              padding: EdgeInsets.only(
                right: stebPadding,
                left: stebPadding,
              ),
              child: Card(
                elevation: 1,
                child: Container(
                  height: resp.responsiver(height, 125),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: themeSetup.white),
                  padding: EdgeInsets.symmetric(
                    horizontal: resp.responsiverw(width, 10),
                  ),
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ListTile(
                        dense: true,
                        enabled: true,
                        title: Text(
                          "Article Title",
                          style: TextStyle(
                            color: themeSetup.mainTextColor,
                            fontFamily: "Plus Jakarta",
                            fontWeight: FontWeight.w500,
                            fontSize: resp.responsiver(height, 12),
                          ),
                        ),
                        trailing: Text(
                          "Date",
                          style: TextStyle(
                            color: themeSetup.secondaryTextColor,
                            fontFamily: "Plus Jakarta",
                            fontWeight: FontWeight.w500,
                            fontSize: resp.responsiver(height, 8),
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 0),
                      );
                    },
                  ),
                ),
              ),
            ),
            buildContentTitle("Wisata Terdekat", height, width, true),
            buildContentTitle("Wisata Kawasan", height, width, false),
            buildContentTitle("Event", height, width, true),
            buildContentTitle("Konversi Mata Uang", height, width, false),
            buildContentTitle("Hotel & Penginapan", height, width, true),
            buildContentTitle("Referensi Perjalanan", height, width, true),
            buildContentTitle("Hashgram", height, width, false),
          ],
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Category(
                  title: getCategoryButton(index, "label"),
                  color: getCategoryButton(index, "color"),
                  backButton: true,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size.square(
              resp.responsiver(height, 50),
            ),
            primary: getCategoryButton(index, "color"),
            shape: const CircleBorder(),
          ),
        ),
        SizedBox(
          height: resp.responsiver(height, 5),
        ),
        Text(
          getCategoryButton(index, "label"),
          style: TextStyle(
            color: themeSetup.mainTextColor,
            fontFamily: "Plus Jakarta",
            fontWeight: FontWeight.w400,
            fontSize: resp.responsiver(height, 12),
          ),
        )
      ],
    );
  }

  buildContentTitle(txt, height, width, all) {
    return Padding(
      padding: EdgeInsets.only(
        right: resp.responsiverw(width, 20),
        left: resp.responsiverw(width, 20),
        top: resp.responsiver(height, 20),
        bottom: resp.responsiverw(width, 10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            txt,
            style: TextStyle(
              color: themeSetup.mainTextColor,
              fontFamily: "Plus Jakarta",
              fontWeight: FontWeight.w700,
              fontSize: resp.responsiver(height, 16),
            ),
          ),
          Visibility(
            visible: all,
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: themeSetup.blue,
                  fontFamily: "Plus Jakarta",
                  fontWeight: FontWeight.w500,
                  fontSize: resp.responsiver(height, 12),
                ),
                text: "Lihat Semua >",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Category(
                            title: txt,
                            color: themeSetup.accentColor,
                            backButton: true),
                      ),
                    );
                  },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
