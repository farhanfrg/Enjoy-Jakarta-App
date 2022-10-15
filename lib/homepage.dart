import 'package:enjoyjakarta/theme_setup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'responsiver.dart';

class Homepage extends StatefulWidget {
  final String title;
  const Homepage({Key? key, required this.title}) : super(key: key);

  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final double stebPadding = resp.responsiverw(width, 20);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                      right: resp.responsiverw(width, 15), top: stebPadding),
                  child: Ink(
                    height: resp.responsiverw(width, 32),
                    width: resp.responsiverw(width, 32),
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                      color: themeSetup.white,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.headphones_outlined),
                      iconSize: resp.responsiverw(width, 15),
                      color: themeSetup.black,
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: resp.responsiverw(width, 15), top: stebPadding),
                  child: Ink(
                    height: resp.responsiverw(width, 32),
                    width: resp.responsiverw(width, 32),
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                      color: themeSetup.white,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.notifications_none_rounded),
                      iconSize: resp.responsiverw(width, 15),
                      color: themeSetup.black,
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: stebPadding, top: stebPadding),
                  child: Ink(
                    height: resp.responsiverw(width, 32),
                    width: resp.responsiverw(width, 32),
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                      color: themeSetup.white,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      iconSize: resp.responsiverw(width, 15),
                      color: themeSetup.black,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
              floating: true,
              snap: true,
              expandedHeight: resp.responsiver(height, 250),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: resp.responsiver(height, 10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Selamat Pagi, Han Vito",
                                style: TextStyle(
                                  color: themeSetup.white,
                                  fontFamily: "Plus Jakarta",
                                  fontWeight: FontWeight.w500,
                                  fontSize: resp.responsiver(height, 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: resp.responsiverw(width, 120),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  "Explore the beauty of journey in Jakarta.",
                                  style: TextStyle(
                                    color: themeSetup.white,
                                    fontFamily: "Plus Jakarta",
                                    fontWeight: FontWeight.w400,
                                    fontSize: resp.responsiver(height, 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/homepic.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            title: Text("item"),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemCount: 30,
        ),
      ),
    );
  }
}
