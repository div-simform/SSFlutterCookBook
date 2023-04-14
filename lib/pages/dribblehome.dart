import 'package:divyang_sscomposebook/widgtes/dribblewidgtes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DribbleHome extends StatefulWidget {
  const DribbleHome({Key? key}) : super(key: key);

  @override
  State<DribbleHome> createState() => _DribbleHomeState();
}

class _DribbleHomeState extends State<DribbleHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return true;
        },
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(230, 233, 241, 1),
          body: Center(child: SingleChildScrollView(child: _bodyUI())),
        ),
      ),
    );
  }

  Widget _bodyUI() {
    return Container(
      margin: EdgeInsets.only(top: 40, right: 16, left: 16, bottom: 10),
      padding: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(241, 240, 248, 1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white, width: 3.5),
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          DribbleWallpaper(),
          SizedBox(height: 30.0),
          DribbleRichText(
            primaryText: "Discover your",
            secondaryText: "Dream job here",
            colors: Colors.black,
          ),
          SizedBox(height: 30.0),
          DribbleRichText(
            primaryText: 'Explore all the most exiting jobs roles',
            secondaryText: "based on your interest And study major",
            colors: Colors.grey,
            fontSize: 18,
          ),
          SizedBox(height: 40.0),
          DribbleSwapWidget(),
        ],
      ),
    );
  }
}
