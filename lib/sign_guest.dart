import 'package:enjoyjakarta/login_screen.dart';
import 'package:enjoyjakarta/main.dart';
import 'package:enjoyjakarta/responsiver.dart';
import 'package:enjoyjakarta/splashscreen.dart';
import 'package:enjoyjakarta/theme_setup.dart';
import 'package:flutter/material.dart';

class SignGuest extends StatefulWidget {
  final String title;
  const SignGuest({Key? key, required this.title}) : super(key: key);

  @override
  State<SignGuest> createState() => _SignGuestState();
}

class _SignGuestState extends State<SignGuest> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final double stebPadding = resp.responsiver(height, 16);
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/homepic.png',
                  fit: BoxFit.cover,
                  height: height,
                  width: width,
                  alignment: Alignment.center,
                )
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                stebPadding,
                0,
                stebPadding,
                stebPadding,
              ),
              child: SizedBox(
                height: resp.responsiver(height, 231),
                width: resp.responsiverw(width, 343),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 15,
                  child: Padding(
                    padding: EdgeInsets.all(stebPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Welcome",
                          style: TextStyle(
                            color: themeSetup.black,
                            fontFamily: "Plus Jakarta",
                            fontWeight: FontWeight.w700,
                            fontSize: resp.responsiver(height, 24),
                          ),
                        ),
                        Text(
                          "Explore Jakarta with us.",
                          style: TextStyle(
                            color: themeSetup.black,
                            fontFamily: "Plus Jakarta",
                            fontWeight: FontWeight.w500,
                            fontSize: resp.responsiver(height, 20),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: resp.responsiver(height, 52),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: themeSetup.accentColor,
                              elevation: 2,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginScreen(
                                          title: "Login Screen")));
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                  color: themeSetup.white,
                                  fontFamily: "Plus Jakarta",
                                  fontWeight: FontWeight.w700,
                                  fontSize: resp.responsiver(height, 15)),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: resp.responsiver(height, 52),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: themeSetup.white,
                              elevation: 2,
                            ),
                            onPressed: () {
                              print("Button Pressed");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SplashScreenWidget(
                                              title: "Splash Screen")));
                            },
                            child: Text(
                              "Login as guest",
                              style: TextStyle(
                                  color: themeSetup.black,
                                  fontFamily: "Plus Jakarta",
                                  fontWeight: FontWeight.w700,
                                  fontSize: resp.responsiver(height, 15)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
