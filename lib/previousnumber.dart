import 'package:flutter/material.dart';

// import 'main.dart';
class Instructions extends StatefulWidget {
  @override
  _InstructionsState createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Instructions",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Instructions"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text("A 4 digit Random Number is  generated"),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("The Random has no repetion of digits"),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("You have to guess the no in 5 attempts"),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                    "When u type a 4 digit no u will be told if that paticular digit is present in the Random number"),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                    "The Instructions 'N' , 'P' and 'C' in the previous page gives a detail about the particular digit"),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black26,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Text("GO BACK",textAlign: TextAlign.center,),
        
      ),
    ));
  }
}
