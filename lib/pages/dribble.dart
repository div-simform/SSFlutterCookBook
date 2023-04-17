import 'package:divyang_sscomposebook/widgtes/dribblewidgtes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class DribbleDesign extends StatefulWidget {
  const DribbleDesign({Key? key}) : super(key: key);

  @override
  State<DribbleDesign> createState() => _DribbleDesignState();
}

class _DribbleDesignState extends State<DribbleDesign> {
  bool isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: _bodyUI(context: context),
        ),
        backgroundColor: const Color.fromRGBO(230, 233, 241, 1),
      ),
    );
  }

  Widget _bodyUI({BuildContext? context}) {
    return Container(
      margin: EdgeInsets.only(top: 70, right: 16, left: 16, bottom: 20),
      padding: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context!).size.width,
      decoration: BoxDecoration(
        //color: const Color.fromRGBO(232, 224, 232, 0.5),
        color: const Color.fromRGBO(241, 240, 248, 1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white, width: 3.5),
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 60),
          DribbleTextWidget(text: 'Hello Again !', fontSize: 22),
          const SizedBox(height: 10),
          DribbleTextWidget(text: 'Welcome to Simform', fontSize: 25),
          const SizedBox(height: 50.0),
          DribbleUserTextField(hintText: 'Enter username'),
          const SizedBox(height: 30.0),
          DribblePasswordTextField(hintText: 'Password'),
          const SizedBox(height: 15.0),
          Container(
            margin: EdgeInsets.only(right: 14),
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 20.0, color: Colors.white.withOpacity(0.3))
              ],
            ),
            child: Text(
              'Recovery Password',
              //textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.blueGrey, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 40.0),
          DribbleSignInButton(),
          const SizedBox(height: 30.0),
          DribbleDashLine(),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              DribbleAuthButton(
                  authURL:
                      "http://pngimg.com/uploads/google/google_PNG19635.png"),
              DribbleAuthButton(
                  authURL:
                      "https://pngimg.com/uploads/apple_logo/small/apple_logo_PNG19674.png"),
              DribbleAuthButton(
                  authURL:
                      "https://pngimg.com/uploads/facebook_logos/small/facebook_logos_PNG19754.png"),
            ],
          ),
          const SizedBox(height: 40.0),
          DribbleRegisterText()
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}
