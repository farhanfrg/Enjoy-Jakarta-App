import 'package:enjoyjakarta/category.dart';
import 'package:enjoyjakarta/theme_setup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:measure_size/measure_size.dart';
import 'responsiver.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'global.dart' as globals;

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
  Color menuIcon = themeSetup.mainBlue;
  Color menuButton = themeSetup.white;

  bool isPinned = false;

  bool isAudioPlayed = false;

  bool isHamburgerVisible = false;

  @override
  void initState() {
    menuAnimationCtrl = AnimationController(
      duration: const Duration(seconds: 0, milliseconds: 700),
      vsync: this,
      reverseDuration: const Duration(seconds: 0, milliseconds: 700),
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
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    List<Widget> generateButton(count) {
      List<Widget> items = [];
      for (int i = 0; i < count; i++) {
        items.add(
          buildButton(i, height, width),
        );
      }
      return items;
    }

    List<Widget> generateWisataKawasan(count, title) {
      List<Widget> items = [];
      for (int i = 0; i < count; i++) {
        items.add(Text(title[i]));
      }
      return items;
    }

    return Scaffold(
      backgroundColor: themeSetup.bgColor,
      body: Stack(
        children: [
          NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
              SliverAppBar(
                title: Padding(
                  padding: EdgeInsets.only(
                    left: resp.responsiverw(width, 10),
                  ),
                  child: AnimatedOpacity(
                    opacity: isPinned ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: const Text("Selamat Pagi, Han Vito"),
                  ),
                ),
                titleTextStyle: TextStyle(
                  color: themeSetup.white,
                  fontFamily: "Plus Jakarta",
                  fontWeight: FontWeight.w500,
                  fontSize: resp.responsiver(height, 16),
                ),
                pinned: true,
                backgroundColor: themeSetup.clear,
                elevation: 0,
                automaticallyImplyLeading: false,
                expandedHeight: resp.responsiver(height, 273),
                flexibleSpace: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      bottom: searchBarHeight / 2,
                      child: Image.asset(
                        "assets/images/homepic.png",
                        fit: BoxFit.cover,
                        color: Color.fromARGB(18, 0, 0, 0),
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
                                    Hero(
                                      tag: "jakartaPlus",
                                      transitionOnUserGestures: true,
                                      child: Image.asset(
                                        'assets/images/plusJakarta.png',
                                        width: resp.responsiver(height, 28),
                                        height: resp.responsiver(height, 55),
                                        fit: BoxFit.contain,
                                      ),
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
                              ],
                            ),
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
                        child: TextField(
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
                              fontWeight: FontWeight.w400,
                              fontSize: resp.responsiver(height, 14),
                            ),
                            filled: true,
                            fillColor: themeSetup.white,
                            prefixIcon: Icon(
                              Icons.search,
                              size: resp.responsiver(height, 18),
                            ),
                            prefixIconColor: themeSetup.mainBlue,
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
                    children: generateButton(categoryIndex.length),
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
                      elevation: 3,
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
                        padding: EdgeInsets.all(
                          resp.responsiverw(width, 12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  DateFormat("EEEE, d MMMM yyyy", "id_ID")
                                      .format(
                                    DateTime.now(),
                                  ),
                                  style: TextStyle(
                                    color: themeSetup.mainBlue,
                                    fontFamily: "Plus Jakarta",
                                    fontWeight: FontWeight.w500,
                                    fontSize: resp.responsiver(height, 12),
                                  ),
                                ),
                                Text(
                                  "29°C",
                                  style: TextStyle(
                                    color: themeSetup.mainBlue,
                                    fontFamily: "Plus Jakarta",
                                    fontWeight: FontWeight.w700,
                                    fontSize: resp.responsiver(height, 46),
                                  ),
                                ),
                                Text(
                                  "Jakarta Utara",
                                  style: TextStyle(
                                    color: themeSetup.mainBlue,
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
                                  height: resp.responsiver(height, 76),
                                  width: resp.responsiver(height, 96),
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  "Sedang Berawan",
                                  style: TextStyle(
                                    color: themeSetup.mainBlue,
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
                travelNewsContent(stebPadding, height, width),
                buildContentTitle("Wisata Terdekat", height, width, true),
                wisataTerdekatContent(height, width, stebPadding),
                buildContentTitle("Wisata Kawasan", height, width, false),
                filterButton(height, stebPadding, wisataKawasanList),
                miniCarouselCard(
                    true,
                    true,
                    height,
                    width,
                    stebPadding,
                    "Place Name",
                    "4.5",
                    "Place Location",
                    10,
                    "assets/images/initialSplash1.png"),
                buildContentTitle("Event", height, width, true),
                buildContentTitle("Konversi Mata Uang", height, width, false),
                buildContentTitle("Hotel & Penginapan", height, width, true),
                miniCarouselCard(
                    true,
                    true,
                    height,
                    width,
                    stebPadding,
                    "Place Name",
                    "4.5",
                    "Place Location",
                    10,
                    "assets/images/initialSplash1.png"),
                buildContentTitle("Referensi Perjalanan", height, width, true),
                miniCarouselCard(
                    false,
                    false,
                    height,
                    width,
                    stebPadding,
                    "Place Name Tour Reference",
                    "4.5",
                    "Place Location",
                    10,
                    "assets/images/initialSplash1.png"),
                buildContentTitle("Hashgram", height, width, false),
                filterButton(height, stebPadding, hashgram)
              ],
            ),
          ),
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: isMenuTap ? 1.0 : 0.0,
              duration: Duration(milliseconds: 700),
              child: Visibility(
                visible: isHamburgerVisible,
                child: GestureDetector(
                  onTap: hamburgerAction,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0x80000000),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            bottom: height / 7,
            child: AnimatedOpacity(
              opacity: isMenuTap ? 1.0 : 0.0,
              duration: Duration(milliseconds: 700),
              child: Visibility(
                visible: isHamburgerVisible,
                child: Container(
                  padding: EdgeInsets.only(
                    left: stebPadding,
                    right: stebPadding,
                    top: resp.responsiver(height, 20) * 4,
                  ),
                  color: themeSetup.white,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      if (index < hamburgerProps.length) {
                        return SizedBox(
                          height: resp.responsiver(height, 46),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: themeSetup.clear,
                                shadowColor: themeSetup.clear),
                            onPressed: () {
                              if (index < hamburgerProps.length - 1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Category(
                                      title:
                                          hamburgerProps.keys.elementAt(index),
                                      color: hamburgerColor.values
                                          .elementAt(index),
                                      header:
                                          hamburgerProps.keys.elementAt(index),
                                      backButton: true,
                                      searchBar: hamburgerSearch.values
                                          .elementAt(index),
                                      contentType: 1,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      hamburgerProps.values.elementAt(index),
                                      size: resp.responsiver(height, 15),
                                      color: themeSetup.mainBlue,
                                    ),
                                    SizedBox(width: stebPadding / 2),
                                    Text(
                                      hamburgerProps.keys.elementAt(index),
                                      style: TextStyle(
                                        color: themeSetup.mainBlue,
                                        fontFamily: "Plus Jakarta",
                                        fontWeight: FontWeight.w700,
                                        fontSize: resp.responsiver(height, 12),
                                      ),
                                    ),
                                  ],
                                ),
                                if (index == hamburgerProps.length - 1)
                                  GestureDetector(
                                    child: Text(""),
                                    onTap: () {},
                                  ),
                                if (index < hamburgerProps.length - 1)
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: resp.responsiver(height, 13),
                                    color: themeSetup.mainBlue,
                                  ),
                              ],
                            ),
                          ),
                        );
                      }
                      return Padding(
                        padding: EdgeInsets.only(
                            left: stebPadding,
                            right: stebPadding,
                            top: stebPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: resp.responsiver(height, 239),
                              height: resp.responsiver(height, 46),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: themeSetup.clear,
                                  shadowColor: themeSetup.clear,
                                  side: BorderSide(color: themeSetup.blue),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.lightbulb_outlined,
                                      size: resp.responsiver(height, 20),
                                      color: themeSetup.blue,
                                    ),
                                    SizedBox(
                                      width: stebPadding / 2,
                                    ),
                                    Text(
                                      "Quiz",
                                      style: TextStyle(
                                        color: themeSetup.blue,
                                        fontFamily: "Plus Jakarta",
                                        fontWeight: FontWeight.w700,
                                        fontSize: resp.responsiver(height, 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
                    ),
                    itemCount: hamburgerProps.length + 1,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: resp.responsiver(height, statusBarHeight),
              right: stebPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: resp.responsiver(height, 32),
                  width: resp.responsiver(height, 32),
                  child: FloatingActionButton(
                    heroTag: UniqueKey(),
                    backgroundColor: themeSetup.white,
                    elevation: 2,
                    onPressed: () {
                      setState(() {
                        isAudioPlayed = !isAudioPlayed;
                      });
                    },
                    child: Icon(
                      isAudioPlayed ? Icons.stop : Icons.headset_outlined,
                      size: resp.responsiver(height, 16),
                      color: themeSetup.mainBlue,
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
                    elevation: 2,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Category(
                            title: "Notifikasi",
                            color: themeSetup.accentColor,
                            header: "Notifikasi",
                            backButton: true,
                            searchBar: false,
                            contentType: 1,
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.notifications_outlined,
                      size: resp.responsiver(height, 16),
                      color: themeSetup.mainBlue,
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
                    elevation: 2,
                    onPressed: hamburgerAction,
                    child: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: menuAnimationCtrl,
                      size: resp.responsiver(height, 16),
                      color: menuIcon,
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedOpacity(
            opacity: isMenuTap ? 1.0 : 0.0,
            duration: Duration(milliseconds: 700),
            child: Visibility(
              visible: isHamburgerVisible,
              child: Padding(
                padding: EdgeInsets.only(
                  left: stebPadding,
                  top: statusBarHeight,
                ),
                child: Image.asset(
                  'assets/images/plusJakarta.png',
                  width: resp.responsiver(height, 18),
                  height: resp.responsiver(height, 30),
                  color: themeSetup.black,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  filterButton(double height, double stebPadding, List data) {
    return Container(
      height: resp.responsiver(height, 30),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: stebPadding),
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(
              resp.responsiver(height, 4),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  resp.responsiver(height, 4),
                ),
                child: Text(
                  data[index],
                  style: TextStyle(
                    color: themeSetup.blue,
                    fontFamily: "Plus Jakarta",
                    fontWeight: FontWeight.w500,
                    fontSize: resp.responsiver(height, 10),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  miniCarouselCard(
    bool isRating,
    bool isLocation,
    double height,
    double width,
    double stebPadding,
    String title,
    String rating,
    String location,
    int itemCount,
    String imagePath,
  ) {
    return SizedBox(
      height: resp.responsiver(height, 211),
      width: resp.responsiverw(width, 146),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: stebPadding),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                resp.responsiver(height, 5),
              ),
              child: AspectRatio(
                aspectRatio: 0.66,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 3,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned.fill(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xb3000000),
                                      themeSetup.clear,
                                      themeSetup.clear,
                                      themeSetup.clear,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 0.85,
                            child: Container(
                              padding: EdgeInsets.all(
                                resp.responsiver(height, 10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Visibility(
                                    visible: isRating,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size:
                                                  resp.responsiver(height, 15),
                                              color: Color(0xffFFD748),
                                            ),
                                            Text(
                                              rating,
                                              style: TextStyle(
                                                color: themeSetup.white,
                                                fontFamily: "Plus Jakarta",
                                                fontWeight: FontWeight.w700,
                                                fontSize: resp.responsiver(
                                                    height, 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: resp.responsiver(height, 5),
                    ),
                    SizedBox(
                      width: resp.responsiver(height, 118),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  title + "$index",
                                  style: TextStyle(
                                    color: themeSetup.mainBlue,
                                    fontFamily: "Plus Jakarta",
                                    fontWeight: FontWeight.w700,
                                    fontSize: resp.responsiver(height, 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: isLocation,
                            child: SizedBox(
                              height: resp.responsiver(height, 8),
                            ),
                          ),
                          Visibility(
                            visible: isLocation,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  color: themeSetup.blue,
                                  size: resp.responsiver(height, 12),
                                ),
                                Text(
                                  "  " + location,
                                  style: TextStyle(
                                    color: themeSetup.secondaryTextColor,
                                    fontFamily: "Plus Jakarta",
                                    fontWeight: FontWeight.w400,
                                    fontSize: resp.responsiver(height, 8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  travelNewsContent(double stebPadding, double height, double width) {
    return Padding(
      padding: EdgeInsets.only(
        right: stebPadding,
        left: stebPadding,
      ),
      child: Card(
        elevation: 3,
        child: Container(
          height: resp.responsiver(height, 135),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: themeSetup.white),
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: resp.responsiverw(width, 10),
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                dense: true,
                enabled: true,
                visualDensity: VisualDensity(vertical: -4),
                title: Text(
                  "Article Title $index",
                  style: TextStyle(
                    color: themeSetup.mainBlue,
                    fontFamily: "Plus Jakarta",
                    fontWeight: FontWeight.w500,
                    fontSize: resp.responsiver(height, 12),
                  ),
                ),
                trailing: Text(
                  "22 Desember 2022",
                  style: TextStyle(
                    color: themeSetup.secondaryTextColor,
                    fontFamily: "Plus Jakarta",
                    fontWeight: FontWeight.w500,
                    fontSize: resp.responsiver(height, 8),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 1,
                color: Colors.black,
              );
            },
          ),
        ),
      ),
    );
  }

  wisataTerdekatContent(double height, double width, double stebPadding) {
    return SizedBox(
      height: resp.responsiver(height, 332),
      width: resp.responsiverw(width, 187),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: stebPadding),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/initialSplash1.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          themeSetup.clear,
                          themeSetup.clear,
                          themeSetup.clear,
                          Color(0xb3000000)
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 0.56,
                  child: Container(
                    padding: EdgeInsets.all(
                      resp.responsiver(height, 10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: resp.responsiver(height, 24),
                              width: resp.responsiver(height, 48),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Color(0x80ffffff),
                                  borderRadius: BorderRadius.circular(
                                      resp.responsiver(height, 8)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: resp.responsiver(height, 15),
                                      color: Color(0xffFFD748),
                                    ),
                                    Text(
                                      " 5.0",
                                      style: TextStyle(
                                        color: themeSetup.mainBlue,
                                        fontFamily: "Plus Jakarta",
                                        fontWeight: FontWeight.w700,
                                        fontSize: resp.responsiver(height, 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Place Name$index",
                                  style: TextStyle(
                                    color: themeSetup.white,
                                    fontFamily: "Plus Jakarta",
                                    fontWeight: FontWeight.w700,
                                    fontSize: resp.responsiver(height, 12),
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: resp.responsiver(height, 24),
                                      width: resp.responsiver(height, 24),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: themeSetup.gray,
                                        ),
                                        child: Icon(
                                          Icons.bookmark,
                                          size: resp.responsiver(height, 14),
                                          color: themeSetup.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: stebPadding / 2,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: resp.responsiver(height, 10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: themeSetup.white,
                                      size: resp.responsiver(height, 12),
                                    ),
                                    Text(
                                      "  Place Location",
                                      style: TextStyle(
                                        color: themeSetup.white,
                                        fontFamily: "Plus Jakarta",
                                        fontWeight: FontWeight.w400,
                                        fontSize: resp.responsiver(height, 8),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "3 Km",
                                  style: TextStyle(
                                    color: themeSetup.white,
                                    fontFamily: "Plus Jakarta",
                                    fontWeight: FontWeight.w400,
                                    fontSize: resp.responsiver(height, 8),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  List wisataKawasanList = [
    "Lihat Semua",
    "Kemang",
    "Ancol",
    "Jatinegara",
    "Kebon Jeruk",
    "Cipete"
  ];

  List hashgram = [
    "Lihat Semua",
    "#EnjoyJakartaApp",
    "#JakartaTourism",
    "#CityTourJakarta",
    "#JakartaSatu",
    "#JakartaKita"
  ];

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

  Map hamburgerProps = {
    "Ulasan": Icons.star,
    "Poin User": FontAwesomeIcons.coins,
    "Level & Benefit": Icons.info,
    "Ranking": FontAwesomeIcons.crown,
    "Keluhan": Icons.forum,
    "FAQ": Icons.quiz,
    "Bahasa": Icons.public
  };

  Map hamburgerColor = {
    "Ulasan": themeSetup.accentColor,
    "Poin User": Color(0xffC7EBFF),
    "Level & Benefit": Color(0xffC7EBFF),
    "Ranking": Color(0xffC7EBFF),
    "Keluhan": themeSetup.accentColor,
    "FAQ": themeSetup.accentColor,
    "Bahasa": ""
  };

  Map hamburgerSearch = {
    "Ulasan": true,
    "Poin User": false,
    "Level & Benefit": false,
    "Ranking": false,
    "Keluhan": false,
    "FAQ": false,
    "Bahasa": ""
  };

  hamburgerAction() async {
    if (isMenuTap == false) {
      setState(
        () {
          isMenuTap = true;
          menuIcon = themeSetup.white;
          menuButton = themeSetup.alertColor;
          isHamburgerVisible = true;
          menuAnimationCtrl.forward();
        },
      );
    } else {
      setState(
        () {
          isMenuTap = false;
          menuIcon = themeSetup.mainBlue;
          menuButton = themeSetup.white;
          menuAnimationCtrl.reverse();
        },
      );
      Future.delayed(
        Duration(milliseconds: 700),
        () {
          setState(
            () {
              isHamburgerVisible = false;
            },
          );
        },
      );
    }
  }

  getCategoryButton(index, data) {
    var label = categoryIndex.entries.firstWhere((e) => e.value == index).key;

    if (data == "label") {
      return label;
    } else if (data == "color") {
      return categoryColor.entries.firstWhere((e) => e.key == label).value;
    }
  }

  buildWisataKawasanFilter(title, height, width) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0x80ffffff),
        borderRadius: BorderRadius.circular(resp.responsiver(height, 8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: themeSetup.mainBlue,
              fontFamily: "Plus Jakarta",
              fontWeight: FontWeight.w700,
              fontSize: resp.responsiver(height, 12),
            ),
          ),
        ],
      ),
    );
  }

  buildButton(index, height, width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Image.asset(
            'assets/images/' + getCategoryButton(index, "label") + '.png',
            width: resp.responsiver(height, 20),
            height: resp.responsiver(height, 20),
            fit: BoxFit.contain,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Category(
                  title: getCategoryButton(index, "label"),
                  color: getCategoryButton(index, "color"),
                  header: getCategoryButton(index, "label"),
                  backButton: true,
                  searchBar: true,
                  contentType: 1,
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
            color: themeSetup.mainBlue,
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
              color: themeSetup.mainBlue,
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
                          header: txt,
                          backButton: true,
                          searchBar: true,
                          contentType: txt == "Hotel & Penginapan" ? 2 : 3,
                        ),
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
