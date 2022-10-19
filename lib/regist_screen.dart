import 'package:enjoyjakarta/splashscreen.dart';
import 'package:enjoyjakarta/theme_setup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'responsiver.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegistScreen extends StatefulWidget {
  final String title;
  const RegistScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<RegistScreen> createState() => _RegistScreen();
}

class _RegistScreen extends State<RegistScreen> {
  double registNum = 1;
  bool test = true;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final double stebPadding = resp.responsiverw(width, 20);

    var registData = {
      "Username": "",
      "Nama Lengkap": "",
      "Handphone Aktif": "",
      "Tanggal Lahir": "",
      "Jenis Kelamin": "",
      "Negara Asal": "",
      "Email": "",
      "Kata Sandi": "",
      "Konfirmasi Kata Sandi": "",
    };

    var registPage = {
      "Username": 1,
      "Nama Lengkap": 1,
      "Handphone Aktif": 1,
      "Tanggal Lahir": 2,
      "Jenis Kelamin": 2,
      "Negara Asal": 2,
      "Email": 3,
      "Kata Sandi": 3,
      "Konfirmasi Kata Sandi": 3,
    };

    var registType = {
      "Username": "Uname",
      "Nama Lengkap": "String",
      "Handphone Aktif": "Phone",
      "Tanggal Lahir": "Date",
      "Jenis Kelamin": "Gender",
      "Negara Asal": "Country",
      "Email": "Email",
      "Kata Sandi": "Pass",
      "Konfirmasi Kata Sandi": "Pass",
    };

    // void getPage(Map map, double page) {
    //   map.forEach(
    //     (key, value) {
    //       if (value == page) {
    //         print(key);
    //       }
    //     },
    //   );
    // }

    // getPage(registPage, registNum);

    return Scaffold(
      backgroundColor: Color(0xfffefafa),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: resp.responsiver(height, 70),
            ),
            Image.asset(
              'assets/images/mainlogo.png',
              width: 288,
              height: 100,
              fit: BoxFit.cover,
            ), // Main Logo
            SizedBox(
              height: resp.responsiver(height, 50),
            ),
            Image.asset(
              'assets/images/frameRegister' + '$registNum.png',
              width: resp.responsiverw(width, 193),
              height: resp.responsiver(height, 36),
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    returnLabel(labelData(registNum), 0),
                    style: TextStyle(
                      color: themeSetup.mainTextColor,
                      fontFamily: "Plus Jakarta",
                      fontWeight: FontWeight.w500,
                      fontSize: resp.responsiver(height, 16),
                    ),
                  )
                ],
              ),
            ), // Email Text Field Label
            textForm(stebPadding, height, width),
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    returnLabel(labelData(registNum), 1),
                    style: TextStyle(
                      color: themeSetup.mainTextColor,
                      fontFamily: "Plus Jakarta",
                      fontWeight: FontWeight.w500,
                      fontSize: resp.responsiver(height, 16),
                    ),
                  )
                ],
              ),
            ), // Password Text Field Label
            textForm(stebPadding, height, width),
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    returnLabel(labelData(registNum), 2),
                    style: TextStyle(
                      color: themeSetup.mainTextColor,
                      fontFamily: "Plus Jakarta",
                      fontWeight: FontWeight.w500,
                      fontSize: resp.responsiver(height, 16),
                    ),
                  )
                ],
              ),
            ), // Password Text Field Label
            if (registNum == 1) intlPhone(stebPadding, height, width),
            if (registNum > 1) textForm(stebPadding, height, width),
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 25),
              ),
              child: Container(
                width: double.infinity,
                height: resp.responsiver(height, 45),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: themeSetup.accentColor,
                  ),
                  onPressed: () async {
                    setState(
                      () {
                        if (registNum == 3) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SplashScreenWidget(
                                  title: "Splash Screen"),
                            ),
                          ).then((value) => registNum = 1);
                        } else {
                          registNum++;
                        }
                      },
                    );
                    print("Button Pressed");
                    // var url = Uri.https('devgeosys.com', 'api/token', {
                    //   "email": "andi@gmail.com",
                    //   "password": r"Sup3rsecret$Passw0rd!",
                    //   "device_name": "coba"
                    // });
                    // var response = await http.post(url);
                    // print(url);
                    // print('Response status: ${response.statusCode}');
                    // print('Response body: ${response.body}');
                  },
                  child: Text(
                    "Lanjutkan",
                    style: TextStyle(
                        color: themeSetup.white,
                        fontFamily: "Plus Jakarta",
                        fontWeight: FontWeight.w700,
                        fontSize: resp.responsiver(height, 16)),
                  ),
                ),
              ),
            ), //Login Button
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Divider(
                          thickness: 1,
                          endIndent: 10,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'atau',
                        style: TextStyle(
                            color: themeSetup.mainTextColor,
                            fontFamily: "Plus Jakarta",
                            fontWeight: FontWeight.w400,
                            fontSize: resp.responsiver(height, 14)),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Divider(
                          thickness: 1,
                          indent: 10,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), // Atau Divider
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 20),
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    width: double.infinity,
                    height: resp.responsiver(height, 45),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: themeSetup.white,
                      ),
                      onPressed: () => setState(
                        () => test = !test,
                      ),
                      child: Text(
                        "Login melalui Google",
                        style: TextStyle(
                          color: themeSetup.black,
                          fontFamily: "Plus Jakarta",
                          fontWeight: FontWeight.w500,
                          fontSize: resp.responsiver(height, 14),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: stebPadding),
                    child: Container(
                      width: resp.responsiverw(width, 25),
                      height: resp.responsiverw(width, 25),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/google-logo.png',
                      ),
                    ),
                  ),
                ],
              ),
            ), // Google Login Divider
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tidak memiliki akun?",
                    style: TextStyle(
                      color: themeSetup.black,
                      fontFamily: "Plus Jakarta",
                      fontWeight: FontWeight.w400,
                      fontSize: resp.responsiver(height, 14),
                    ),
                  ),
                  Text(
                    " Daftar Sekarang",
                    style: TextStyle(
                      color: themeSetup.blue,
                      fontFamily: "Plus Jakarta",
                      fontWeight: FontWeight.w400,
                      fontSize: resp.responsiver(height, 14),
                    ),
                  )
                ],
              ),
            ), //Registration Path
          ],
        ),
      ),
    );
  }

  List<String> labelData(page) {
    if (page == 1) {
      return labelPage1;
    }
    if (page == 2) {
      return labelPage2;
    }
    if (page == 3) {
      return labelPage3;
    } else {
      return ["error"];
    }
  }

  returnLabel(data, order) {
    return data[order];
  }

  var labelPage1 = ["Username", "Nama Lengkap", "Handphone Aktif"];
  var labelPage2 = ["Tanggal Lahir", "Jenis Kelamin", "Negara Asal"];
  var labelPage3 = ["Email", "Kata Sandi", "Konfirmasi Kata Sandi"];

  Widget textForm(stebPadding, height, width) {
    return Padding(
      padding: EdgeInsets.only(
        left: stebPadding,
        right: stebPadding,
        top: resp.responsiver(height, 15),
      ),
      child: SizedBox(
        height: resp.responsiver(height, 46),
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
            hintText: "Ketik disini",
            hintStyle: TextStyle(
                color: themeSetup.secondaryTextColor,
                fontFamily: "Plus Jakarta",
                fontWeight: FontWeight.w300,
                fontSize: resp.responsiver(height, 13)),
            filled: true,
            fillColor: themeSetup.textFieldColor,
          ),
        ),
      ),
    );
  }

  PhoneNumber number = PhoneNumber(isoCode: 'ID');
  final TextEditingController controller = TextEditingController();
  Widget intlPhone(stebPadding, height, width) {
    return Padding(
      padding: EdgeInsets.only(
          left: stebPadding,
          right: stebPadding,
          top: resp.responsiver(height, 15)),
      child: SizedBox(
        height: resp.responsiver(height, 46),
        child: InternationalPhoneNumberInput(
          cursorColor: themeSetup.secondaryTextColor,
          inputDecoration: InputDecoration(
            filled: true,
            fillColor: themeSetup.textFieldColor,
            hintText: "  Masukkan Nomor Handphone",
            hintStyle: TextStyle(
              color: themeSetup.secondaryTextColor,
              fontFamily: "Plus Jakarta",
              fontWeight: FontWeight.w300,
              fontSize: resp.responsiver(height, 13),
            ),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onInputChanged: (PhoneNumber number) {
            print(number.phoneNumber);
          },
          selectorConfig: SelectorConfig(
              leadingPadding: stebPadding,
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              setSelectorButtonAsPrefixIcon: true,
              trailingSpace: false),
          selectorTextStyle: TextStyle(
            color: themeSetup.mainTextColor,
            fontFamily: "Plus Jakarta",
            fontWeight: FontWeight.w500,
            fontSize: resp.responsiver(height, 13),
          ),
          initialValue: number,
          textFieldController: controller,
          keyboardType:
              TextInputType.numberWithOptions(signed: true, decimal: true),
        ),
      ),
    );
  }

  Widget passwordForm() {
    return Container();
  }

  Widget dropDown() {
    return Container();
  }

  Widget datePicker() {
    return Container();
  }
}
