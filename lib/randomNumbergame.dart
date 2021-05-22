import 'dart:math';

import 'package:flutter/material.dart';

import 'previousnumber.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int c = 0;
  String value;
  bool started = false;
  String show = "";
  String name = "CLICK THE BUTTON TO START GAME";
  String num = "3456";
  void generateRandom() {
    Random r = new Random();
    String t = (r.nextInt(9999 - 999) + 1000).toString();
    int k = 1;
    for (int i = 0; i < 3; i++) {
      var ch = t.substring(i, i + 1);
      if (!(t.lastIndexOf(ch) == i)) {
        k++;
        break;
      }
    }
    num = t;
    if (k > 1) generateRandom();
  }

  void _incrementCounter() {
    setState(() {
      name = "";

      int len = value.length;
      if (len == 4) {
        if (value == num) {
          name =
              "Correct in $c attemps:Play Again, Click the btton to start new game";
          c = -1;
          show = "";
          started = false;
        } else {
          show = show + " " + value;
          for (int i = 0; i < 4; i++) {
            var ch = value.substring(i, i + 1);
            if (num.contains(ch)) {
              int t = num.indexOf(ch);
              if (t == i)
                name = name + "C";
              else
                name += "P";
            } else
              name += "N";
          }
          if (c == 5) {
            started = false;
            show = "";
            if (value == num)
              name = "You Won: Click the button to start new game";
            else
              name =
                  "You LoSt. Number was $num: Click the button to start new game";
            c = -1;
          }
        }
      } else {
        c--;
        name = "Enter only 4 digit number:TRY Again";
      }
    });
  }

  void startGame() {
    setState(() {
      if (c == 0) {
        generateRandom();
        name = "GAME STARTED";
        started = true;
      } else
        _incrementCounter();
      c++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Random Numbers Game'),
      ),

      // drawer is made ... no use for now just learning
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text(
              "This is drawer head",
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
              title: Text("Drawer 1"),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              title: Text("Drawer 2"),
              onTap: () {
                //  Navigator.push (context,MaterialPageRoute(
                //    builder: (context) => Instructions()
                //  ));
              }),
        ], //children
      )),
      body: SingleChildScrollView(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  textAlign: TextAlign.center,
                  maxLength: 4,
                  decoration: InputDecoration(
                      fillColor: Colors.purple,
                      filled: true,
                      hintText: "Enter the number here",
                      border: OutlineInputBorder(
                          gapPadding: 4.0,
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                  onChanged: (text) {
                    value = text;
                  },
                ),
                Text(
                  "Attempt no $c",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: startGame,
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    alignment: Alignment.center,
                    child: started
                        ? Text(
                            "Click Here to Check",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            "Click Here to Start",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Instructions()));
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    alignment: Alignment.center,
                    child: Text(
                      "SEE Instructions",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: RichText(
                    text: TextSpan(
                        text: "Previous Numbers: ",
                        style: TextStyle(color: Colors.purple, fontSize: 20),
                        children: [
                          TextSpan(
                              text: "$show",
                              style: TextStyle(color: Colors.green))
                        ]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(color: Colors.red),
                                  child: Text(
                                    "N",
                                    style: TextStyle(color: Colors.black87),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Text(
                                "  means Digit is not correct",
                                style: TextStyle(
                                    color: Colors.purple, fontSize: 17),
                              )
                            ],
                          ),
                        ))),
                Container(
                    child: Align(
                        alignment: Alignment(0, -1.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: DecoratedBox(
                                  decoration:
                                      BoxDecoration(color: Colors.green),
                                  child: Text(
                                    "C",
                                    style: TextStyle(color: Colors.black87),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Text(
                                "  means Digit is correct and correctly placed",
                                style: TextStyle(
                                    color: Colors.purple, fontSize: 16),
                              )
                            ],
                          ),
                        ))),
                Container(
                    child: Align(
                        alignment: Alignment(0, -1.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: DecoratedBox(
                                  decoration:
                                      BoxDecoration(color: Colors.yellow),
                                  child: Text(
                                    "P",
                                    style: TextStyle(color: Colors.black87),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Text(
                                "  means digit is correct but not correctly placed ",
                                style: TextStyle(
                                    color: Colors.purple, fontSize: 17),
                              )
                            ],
                          ),
                        ))),
              ],
            ),
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
