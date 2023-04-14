import 'package:divyang_sscomposebook/pages/buttons.dart';
import 'package:divyang_sscomposebook/pages/column.dart';
import 'package:divyang_sscomposebook/pages/container.dart';
import 'package:divyang_sscomposebook/pages/dribble.dart';
import 'package:divyang_sscomposebook/pages/dribblehome.dart';
import 'package:divyang_sscomposebook/pages/flutterlogo.dart';
import 'package:divyang_sscomposebook/pages/image.dart';
import 'package:divyang_sscomposebook/pages/stack.dart';
import 'package:divyang_sscomposebook/pages/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

//Splash Screen Created......
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          titleMedium: GoogleFonts.roboto(
              color: Colors.purple, fontWeight: FontWeight.w500, fontSize: 22),
        ),
      ),
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
          backgroundColor: const Color.fromRGBO(230, 233, 241, 1),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: const Color.fromRGBO(230, 233, 241, 1),
              statusBarIconBrightness: Theme.of(context).brightness),
          title: Text(
            'Implemented by Divyang',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        backgroundColor: Colors.white,
        body: _listWidgetSection());
  }

  Widget _listWidgetSection() {
    return ListView(
      children: <Widget>[
        _container(widgetName: 'Container', route: const ContainerWidget()),
        _container(widgetName: 'Column & Row', route: const ColumnWidget()),
        _container(
            widgetName: 'Buttons & SizedBox', route: const ButtonsWidget()),
        _container(
            widgetName: 'Flutter-Logo', route: const FlutterLogoWidget()),
        _container(widgetName: 'TextField', route: const TextFieldWidget()),
        _container(widgetName: 'Image-Widget', route: ImageWidget()),
        _container(widgetName: 'Stack Widget', route: StackWidget()),
        _container(widgetName: 'Dribble Home', route: DribbleHome()),
        _container(widgetName: 'Dribble SignIn', route: DribbleDesign())
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
          backgroundColor: Colors.purple,
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w400),
        ),
        child: Text(widgetName),
      ),
    );
  }
}
