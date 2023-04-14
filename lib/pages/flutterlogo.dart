import 'package:divyang_sscomposebook/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterLogoWidget extends StatelessWidget {
  const FlutterLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop();
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
  FlutterLogoStyle _flutterLogoStyle = FlutterLogoStyle.markOnly;
  double _size = 100;
  Color _colors = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: const Text('Flutter Logo'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MyApp()),
            );
          },
          icon: const Icon(CupertinoIcons.left_chevron),
        ),
        actions: [
          PopupMenuButton(
            enabled: true,
            tooltip: "FlutterLogoStyle-config",
            color: Colors.white,

            icon: const Icon(Icons.list),
            iconSize: 25.0,
            onSelected: (value) {
              setState(() {
                _flutterLogoStyle = value as FlutterLogoStyle;
              });
            },
            position: PopupMenuPosition.under,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: FlutterLogoStyle.horizontal,
                child: Text("FLS.horizontal"),
              ),
              const PopupMenuItem(
                value: FlutterLogoStyle.stacked,
                child: Text("FLS.stacked"),
              ),
              const PopupMenuItem(
                value: FlutterLogoStyle.markOnly,
                child: Text("FLS.markOnly"),
              ),
              PopupMenuItem(
                child: const Text("Size: 150"),
                onTap: () {
                  setState(() {
                    _size = 150;
                  });
                },
              ),
              PopupMenuItem(
                child: const Text("Size: 50"),
                onTap: () {
                  setState(() {
                    _size = 50;
                  });
                },
              ),
              PopupMenuItem(
                child: const Text("Color: purple"),
                onTap: () {
                  setState(() {
                    _colors = Colors.purple;
                  });
                },
              ),
              PopupMenuItem(
                child: const Text("Color: Yellow"),
                onTap: () {
                  setState(() {
                    _colors = Colors.yellow;
                  });
                },
              )
            ],
          ),
        ],
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: FlutterLogo(
            size: _size,
            textColor: _colors,
            duration: const Duration(seconds: 3),
            style: _flutterLogoStyle,
          ),
        ),
      ),
    );
  }
}
