import 'package:flutter/material.dart';
import 'package:myphone/qrScanner.dart';

import 'randomNumbergame.dart';
// import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/randomGame": (context) => MyHomePage(),
          // "/QRcode": (context) => QRScanner()
        },
        title: 'Flutter Random Numbers Game',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          // visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        themeMode: ThemeMode.light,
        // home: ,
        home: NewHomePage());
  }
}

class NewHomePage extends StatefulWidget {
  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(
          "Flutter",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                key: Key("gotogame"),
              onTap: () {
                Navigator.pushNamed(context, "/randomGame");
              },
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                alignment: Alignment.center,
                child: Text(
                  "Play Random Number Game",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.pushNamed(context, "/QRcode");
            //   },
            //   child: Container(
            //     height: 60,
            //     width: 350,
            //     decoration: BoxDecoration(
            //         color: Colors.purple,
            //         borderRadius: BorderRadius.all(Radius.circular(25))),
            //     alignment: Alignment.center,
            //     child: Text(
            //       "QR Scanner",
            //       style: TextStyle(
            //         fontSize: 25,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
