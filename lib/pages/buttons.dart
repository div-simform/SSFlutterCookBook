import 'package:divyang_sscomposebook/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
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
  String _response = "Press Button";
  var _list = ['Apple', 'Samsung', 'Oppo'];
  String selectedValue = "Select";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(_response),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MyApp()),
            );
          },
          icon: const Icon(CupertinoIcons.left_chevron),
        ),
        actions: [
          PopupMenuButton<int>(
            enabled: true,
            color: Colors.yellow,
            position: PopupMenuPosition.under,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text("First"),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text("Second"),
              ),
            ],
          ),
        ],
        backgroundColor: Colors.blueAccent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.blueAccent,
        ),
      ),
      body: _buttons(),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _response = "Floating Button Pressed";
          });
        },
        child: const Icon(Icons.person),
      ),
    );
  }

  Widget _buttons() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onLongPress: () {
              setState(() {
                _response = "Long Press Text Button Pressed";
              });
            },
            onPressed: () {
              setState(() {
                _response = "Text Button Pressed";
              });
            },
            child: const Text('TextButton'),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onLongPress: () {
              setState(() {
                _response = "Long Press Elevated Button Pressed";
              });
            },
            onPressed: () {
              setState(() {
                _response = "Elevated Button Pressed";
              });
            },
            child: const Text("Elevated Button"),
          ),
          const SizedBox(
            height: 20.0,
          ),
          IconButton(
            tooltip: 'Icons Button',
            onPressed: () {
              setState(() {
                _response = "Icon Button Pressed";
              });
            },
            icon: const Icon(
              Icons.add,
              color: Colors.purple,
              size: 30,
            ),
          ),
          OutlinedButton(
            onLongPress: () {
              setState(() {
                _response = "Long Press Outlined Button Pressed";
              });
            },
            onPressed: () {
              setState(() {
                _response = "Outlined Button Pressed";
              });
            },
            child: const Text('Outlined Button'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              height: 35,
              color: const Color(0xFF801E48),
              child: new Text('MaterialButton',
                  style: new TextStyle(fontSize: 16.0, color: Colors.white)),
              onPressed: () {
                setState(() {
                  _response = "Material Button Pressed";
                });
              },
            ),
          ),

          GestureDetector(
            onTapDown: (data) {
              print('OnTap Down');
              setState(() {
                _response = "OnTapDOWN Gesture Pressed";
              });
            },
            onTapUp: (data){
              setState(() {
                _response = "OnTapUP Gesture Pressed";
              });
            },
            onTap: (){
              print('On Tap');
              setState(() {
                _response = "OnTap Gesture Pressed";
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: 150,
              height: 50,
              color: Colors.grey,
              child: const Text('GestureDetector',style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
