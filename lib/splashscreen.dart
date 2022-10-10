import 'package:enjoyjakarta/sign_guest.dart';
import 'package:enjoyjakarta/theme_setup.dart';
import 'package:flutter/material.dart';
import 'responsiver.dart';

class SplashScreenWidget extends StatefulWidget {
  final String title;
  const SplashScreenWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final double stebPadding = resp.responsiverw(width, 32);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(children: [
              Image.asset(
                'assets/images/initialSplash1.png',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
              )
            ]),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  stebPadding, stebPadding, stebPadding, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore Beauty of Journey in Jakarta.",
                    style: TextStyle(
                        color: themeSetup.white,
                        fontFamily: "Plus Jakarta",
                        fontWeight: FontWeight.w800,
                        fontSize: resp.responsiver(height, 40)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Everything you can imagine is here.",
                    style: TextStyle(
                        color: themeSetup.white,
                        fontFamily: "Plus Jakarta",
                        fontWeight: FontWeight.w500,
                        fontSize: resp.responsiver(height, 16)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: resp.responsiver(height, 50)),
        child: SizedBox(
          height: resp.responsiver(height, 60),
          width: resp.responsiver(height, 60),
          child: FloatingActionButton(
            backgroundColor: themeSetup.accentColor,
            child: Icon(
              Icons.arrow_forward,
              color: themeSetup.white,
              size: resp.responsiver(height, 30),
            ),
            onPressed: () {
              // Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const SignGuest(title: "Guest Mode")));
            },
          ),
        ),
      ),
    );
  }
}
