

import 'package:divyang_sscomposebook/pages/buttons.dart';
import 'package:divyang_sscomposebook/pages/column.dart';
import 'package:divyang_sscomposebook/pages/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Splash Screen Created......
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: const _MyState(),
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blueAccent,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.blueAccent,
          ),
          title: const Text('Implemented by Divyang'),
        ),
        backgroundColor: Colors.white,
        body: _listWidgetSection());
  }

  Widget _listWidgetSection() {
    return ListView(
      children: <Widget>[
        _container(widgetName: 'Container', route: const ContainerWidget()),
        _container(widgetName: 'Column & Row', route: const ColumnWidget()),
        _container(widgetName: 'Buttons & SizedBox', route: const ButtonsWidget()),
      ],
    );
  }

  Widget _container({required String widgetName, required route}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => route,
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w400),
        ),
        child: Text(widgetName),
      ),
    );
  }
}
