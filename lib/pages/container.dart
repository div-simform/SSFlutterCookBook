import 'package:divyang_sscomposebook/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key? key}) : super(key: key);

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
          child: const _MyState()),
    );
  }
}

class _MyState extends StatefulWidget {
  const _MyState({Key? key}) : super(key: key);

  @override
  State<_MyState> createState() => _MyStateState();
}

class _MyStateState extends State<_MyState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MyApp()),
            );
          },
          icon: const Icon(CupertinoIcons.left_chevron),
        ),
        backgroundColor: Colors.blueAccent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.blueAccent,
        ),
        title: const Text('Container'),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        physics: const BouncingScrollPhysics(parent: ScrollPhysics()),
        children: <Widget>[
          _simpleContainer(),
          _decorationContainer(),
          _outlineContainer(),
          _circleContainer()
        ],
      ),
    );
  }

  Widget _simpleContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        height: 100.0,
        color: Colors.blue,
        child: const Text(
          'Simple Container',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }

  Widget _decorationContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        height: 200.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.purple, Colors.blue],
          ),
        ),
        child: const Text(
          'Decoration Container',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }

  Widget _outlineContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.black, width: 2.0),
        ),
        child: const Text(
          'BorderOutline Container',
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
      ),
    );
  }

  Widget _circleContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        height: 150.0,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
        child: const Text(
          'Circle Container',
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
      ),
    );
  }
}
