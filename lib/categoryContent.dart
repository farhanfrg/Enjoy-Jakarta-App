import 'package:enjoyjakarta/theme_setup.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'responsiver.dart';

class CategoryContent {
  static dynamic widget(stebPadding, height, width, appBarTitle) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: stebPadding,
            vertical: resp.responsiver(height, 10),
          ),
          child: Text(
            "Tempat $appBarTitle Terdekat",
            style: TextStyle(
              color: themeSetup.mainBlue,
              fontFamily: "Plus Jakarta",
              fontWeight: FontWeight.w700,
              fontSize: resp.responsiver(height, 16),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: stebPadding,
            vertical: resp.responsiver(height, 10),
          ),
          child: SizedBox(
            height: resp.responsiver(height, 645),
            width: resp.responsiverw(width, 343),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: resp.responsiver(height, 214),
                  width: resp.responsiverw(width, 343),
                  child: Card(
                    elevation: 3,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          bottom: resp.responsiver(height, 75),
                          child: Image.asset(
                            "assets/images/homepic.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          top: resp.responsiver(height, 130),
                          child: Padding(
                            padding: EdgeInsets.all(
                              resp.responsiver(height, 10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Place Name",
                                      style: TextStyle(
                                        color: themeSetup.mainBlue,
                                        fontFamily: "Plus Jakarta",
                                        fontWeight: FontWeight.w700,
                                        fontSize: resp.responsiver(height, 12),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: resp.responsiver(height, 5),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.watch_later,
                                      color: themeSetup.blue,
                                      size: resp.responsiver(height, 10),
                                    ),
                                    Text(
                                      "  Open Time",
                                      style: TextStyle(
                                        color: themeSetup.mainBlue,
                                        fontFamily: "Plus Jakarta",
                                        fontWeight: FontWeight.w400,
                                        fontSize: resp.responsiver(height, 8),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_rounded,
                                          color: themeSetup.blue,
                                          size: resp.responsiver(height, 10),
                                        ),
                                        Text(
                                          "  Place Location",
                                          style: TextStyle(
                                            color: themeSetup.mainBlue,
                                            fontFamily: "Plus Jakarta",
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                resp.responsiver(height, 8),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.route,
                                          color: themeSetup.blue,
                                          size: resp.responsiver(height, 10),
                                        ),
                                        Text(
                                          "  Place Location",
                                          style: TextStyle(
                                            color: themeSetup.mainBlue,
                                            fontFamily: "Plus Jakarta",
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                resp.responsiver(height, 8),
                                          ),
                                        ),
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
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: stebPadding,
            vertical: resp.responsiver(height, 10),
          ),
          child: Text(
            "Muat Lainnya",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: themeSetup.mainBlue,
                fontFamily: "Plus Jakarta",
                fontWeight: FontWeight.w400,
                fontSize: resp.responsiver(height, 12),
                decoration: TextDecoration.underline),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: stebPadding,
            vertical: resp.responsiver(height, 10),
          ),
          child: Text(
            "Tempat $appBarTitle Populer Lainnya",
            style: TextStyle(
              color: themeSetup.mainBlue,
              fontFamily: "Plus Jakarta",
              fontWeight: FontWeight.w700,
              fontSize: resp.responsiver(height, 16),
            ),
          ),
        ),
        SizedBox(
          height: resp.responsiver(height, 156),
          width: resp.responsiverw(width, 146),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: stebPadding),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
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
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 0.93,
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
                                      "assets/images/homepic.png",
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
                                    aspectRatio: 1.625,
                                    child: Container(
                                      padding: EdgeInsets.all(
                                        resp.responsiver(height, 10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: resp.responsiver(
                                                        height, 15),
                                                    color: Color(0xffFFD748),
                                                  ),
                                                  Text(
                                                    "4.2",
                                                    style: TextStyle(
                                                      color: themeSetup.white,
                                                      fontFamily:
                                                          "Plus Jakarta",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          resp.responsiver(
                                                              height, 12),
                                                    ),
                                                  ),
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
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        top: resp.responsiver(height, 80),
                        child: Padding(
                          padding: EdgeInsets.all(
                            resp.responsiver(height, 5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Place Name",
                                    style: TextStyle(
                                      color: themeSetup.mainBlue,
                                      fontFamily: "Plus Jakarta",
                                      fontWeight: FontWeight.w700,
                                      fontSize: resp.responsiver(height, 12),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: resp.responsiver(height, 5),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.watch_later,
                                    color: themeSetup.blue,
                                    size: resp.responsiver(height, 10),
                                  ),
                                  Text(
                                    "  Open Time",
                                    style: TextStyle(
                                      color: themeSetup.secondaryTextColor,
                                      fontFamily: "Plus Jakarta",
                                      fontWeight: FontWeight.w400,
                                      fontSize: resp.responsiver(height, 8),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_rounded,
                                        color: themeSetup.blue,
                                        size: resp.responsiver(height, 10),
                                      ),
                                      Text(
                                        "  Place Location",
                                        style: TextStyle(
                                          color: themeSetup.secondaryTextColor,
                                          fontFamily: "Plus Jakarta",
                                          fontWeight: FontWeight.w400,
                                          fontSize: resp.responsiver(height, 8),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.route,
                                        color: themeSetup.blue,
                                        size: resp.responsiver(height, 10),
                                      ),
                                      Text(
                                        "  20 Km",
                                        style: TextStyle(
                                          color: themeSetup.secondaryTextColor,
                                          fontFamily: "Plus Jakarta",
                                          fontWeight: FontWeight.w400,
                                          fontSize: resp.responsiver(height, 8),
                                        ),
                                      ),
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  static dynamic widget2(stebPadding, height, width, appBarTitle, hotel) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: stebPadding,
            vertical: resp.responsiver(height, 10),
          ),
          child: Text(
            hotel ? "$appBarTitle Terdekat" : "Tempat $appBarTitle",
            style: TextStyle(
              color: themeSetup.mainBlue,
              fontFamily: "Plus Jakarta",
              fontWeight: FontWeight.w700,
              fontSize: resp.responsiver(height, 16),
            ),
          ),
        ),
        SizedBox(
          height: resp.responsiver(height, 380),
          width: resp.responsiverw(width, 343),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: stebPadding),
            scrollDirection: Axis.vertical,
            itemCount: 15,
            itemBuilder: (context, index) {
              return AspectRatio(
                aspectRatio: 4.5,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      resp.responsiver(height, 3),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AspectRatio(
                              aspectRatio: 1.69,
                              child: Card(
                                elevation: 3,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Image.asset(
                                        "assets/images/homepic.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned.fill(
                          left: resp.responsiverw(width, 105),
                          child: Padding(
                            padding: EdgeInsets.all(
                              resp.responsiver(height, 3),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Place Name",
                                          style: TextStyle(
                                            color: themeSetup.mainBlue,
                                            fontFamily: "Plus Jakarta",
                                            fontWeight: FontWeight.w700,
                                            fontSize:
                                                resp.responsiver(height, 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Visibility(
                                      visible: hotel,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: resp.responsiver(height, 15),
                                            color: Color(0xffFFD748),
                                          ),
                                          Text(
                                            "4.2",
                                            style: TextStyle(
                                              color: themeSetup.mainBlue,
                                              fontFamily: "Plus Jakarta",
                                              fontWeight: FontWeight.w700,
                                              fontSize:
                                                  resp.responsiver(height, 12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: resp.responsiver(height, 5),
                                ),
                                Visibility(
                                  visible: !hotel,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.watch_later,
                                        color: themeSetup.blue,
                                        size: resp.responsiver(height, 10),
                                      ),
                                      Text(
                                        "  Open Time",
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_rounded,
                                          color: themeSetup.blue,
                                          size: resp.responsiver(height, 10),
                                        ),
                                        Text(
                                          "  Place Location",
                                          style: TextStyle(
                                            color:
                                                themeSetup.secondaryTextColor,
                                            fontFamily: "Plus Jakarta",
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                resp.responsiver(height, 8),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.route,
                                          color: themeSetup.blue,
                                          size: resp.responsiver(height, 10),
                                        ),
                                        Text(
                                          "  20 Km",
                                          style: TextStyle(
                                            color:
                                                themeSetup.secondaryTextColor,
                                            fontFamily: "Plus Jakarta",
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                resp.responsiver(height, 8),
                                          ),
                                        ),
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
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: stebPadding,
            vertical: resp.responsiver(height, 10),
          ),
          child: Text(
            "Muat Lainnya",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: themeSetup.mainBlue,
                fontFamily: "Plus Jakarta",
                fontWeight: FontWeight.w400,
                fontSize: resp.responsiver(height, 12),
                decoration: TextDecoration.underline),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: stebPadding,
            vertical: resp.responsiver(height, 10),
          ),
          child: Text(
            "$appBarTitle Populer Lainnya",
            style: TextStyle(
              color: themeSetup.mainBlue,
              fontFamily: "Plus Jakarta",
              fontWeight: FontWeight.w700,
              fontSize: resp.responsiver(height, 16),
            ),
          ),
        ),
        SizedBox(
          height: resp.responsiver(height, 156),
          width: resp.responsiverw(width, 146),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: stebPadding),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
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
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 0.93,
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
                                      "assets/images/homepic.png",
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
                                    aspectRatio: 1.625,
                                    child: Container(
                                      padding: EdgeInsets.all(
                                        resp.responsiver(height, 10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: resp.responsiver(
                                                        height, 15),
                                                    color: Color(0xffFFD748),
                                                  ),
                                                  Text(
                                                    "4.2",
                                                    style: TextStyle(
                                                      color: themeSetup.white,
                                                      fontFamily:
                                                          "Plus Jakarta",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          resp.responsiver(
                                                              height, 12),
                                                    ),
                                                  ),
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
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        top: resp.responsiver(height, 80),
                        child: Padding(
                          padding: EdgeInsets.all(
                            resp.responsiver(height, 5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Place Name",
                                    style: TextStyle(
                                      color: themeSetup.mainBlue,
                                      fontFamily: "Plus Jakarta",
                                      fontWeight: FontWeight.w700,
                                      fontSize: resp.responsiver(height, 12),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: resp.responsiver(height, 5),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.watch_later,
                                    color: themeSetup.blue,
                                    size: resp.responsiver(height, 10),
                                  ),
                                  Text(
                                    "  Open Time",
                                    style: TextStyle(
                                      color: themeSetup.secondaryTextColor,
                                      fontFamily: "Plus Jakarta",
                                      fontWeight: FontWeight.w400,
                                      fontSize: resp.responsiver(height, 8),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_rounded,
                                        color: themeSetup.blue,
                                        size: resp.responsiver(height, 10),
                                      ),
                                      Text(
                                        "  Place Location",
                                        style: TextStyle(
                                          color: themeSetup.secondaryTextColor,
                                          fontFamily: "Plus Jakarta",
                                          fontWeight: FontWeight.w400,
                                          fontSize: resp.responsiver(height, 8),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.route,
                                        color: themeSetup.blue,
                                        size: resp.responsiver(height, 10),
                                      ),
                                      Text(
                                        "  20 Km",
                                        style: TextStyle(
                                          color: themeSetup.secondaryTextColor,
                                          fontFamily: "Plus Jakarta",
                                          fontWeight: FontWeight.w400,
                                          fontSize: resp.responsiver(height, 8),
                                        ),
                                      ),
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
