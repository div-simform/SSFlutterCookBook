import 'package:divyang_sscomposebook/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({Key? key}) : super(key: key);

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
  bool isOn = false;
  String _response = "CrossAxisAlignment-Row";
  MainAxisAlignment axisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_response);
    print(axisAlignment.toString());
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
        title: Text(!isOn ? 'Row-Widget' : 'Column -Widget'),
        actions: [
          Switch(
            value: isOn,
            onChanged: (value) {
              setState(() {
                isOn = value;
              });
            },
            activeColor: Colors.white,
            activeTrackColor: Colors.green,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.purple, Colors.black],
              ),
            ),
            child: !isOn ? _rowWidget() : _columnWidget(),
          ),
          const SizedBox(height: 10.0),
          _rowSettings()
        ],
      ),
    );
  }

  Widget _columnWidget() {
    return Column(
      mainAxisAlignment: axisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {},
          child: const Text('Hi'),
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Hi')),
        ElevatedButton(onPressed: () {}, child: const Text('Hi')),
      ],
    );
  }

  Widget _rowWidget() {
    return Row(
      mainAxisAlignment: axisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        ElevatedButton(onPressed: () {}, child: const Text('Hi')),
        ElevatedButton(onPressed: () {}, child: const Text('Hi')),
        ElevatedButton(onPressed: () {}, child: const Text('Hi')),
      ],
    );
  }

  Widget _rowSettings() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 2)),
        child: ListView(
          physics: const BouncingScrollPhysics(parent: ScrollPhysics()),
          shrinkWrap: true,
          children: <Widget>[
            ListTile(
              title: const Text('MainAxisAlignment.start'),
              trailing: Radio(
                value: 'MainAxisAlignment.start',
                groupValue: _response,
                onChanged: (value) {
                  setState(() {
                    _response = value!;
                    axisAlignment = MainAxisAlignment.start;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('MainAxisAlignment.center'),
              trailing: Radio(
                value: 'CrossAxisAlignment.center',
                groupValue: _response,
                onChanged: (value) {
                  setState(
                    () {
                      _response = value!;
                      axisAlignment = MainAxisAlignment.center;
                    },
                  );
                },
              ),
            ),
            ListTile(
              title: const Text('MainAxisAlignment.end'),
              trailing: Radio(
                value: 'MainAxisAlignment.end',
                groupValue: _response,
                onChanged: (value) {
                  setState(() {
                    _response = value!;
                    axisAlignment = MainAxisAlignment.end;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('MainAxisAlignment.spaceEvenly'),
              trailing: Radio(
                value: 'CrossAxisAlignment.spaceEvenly',
                groupValue: _response,
                onChanged: (value) {
                  setState(() {
                    _response = value!;
                    axisAlignment = MainAxisAlignment.spaceEvenly;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('MainAxisAlignment.spaceAround'),
              trailing: Radio(
                value: 'CrossAxisAlignment.spaceAround',
                groupValue: _response,
                onChanged: (value) {
                  setState(() {
                    _response = value!;
                    axisAlignment = MainAxisAlignment.spaceAround;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('MainAxisAlignment.spaceBetween'),
              trailing: Radio(
                value: 'CrossAxisAlignment.spaceBetween',
                groupValue: _response,
                onChanged: (value) {
                  setState(() {
                    _response = value!;
                    axisAlignment = MainAxisAlignment.spaceBetween;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('CrossAxisAlignment.start'),
              trailing: Radio(
                value: 'CrossAxisAlignment.start',
                groupValue: _response,
                onChanged: (value) {
                  setState(() {
                    _response = value!;
                    crossAxisAlignment = CrossAxisAlignment.start;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('CrossAxisAlignment.end'),
              trailing: Radio(
                value: 'CrossAxisAlignment.end',
                groupValue: _response,
                onChanged: (value) {
                  setState(() {
                    _response = value!;
                    crossAxisAlignment = CrossAxisAlignment.end;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('CrossAxisAlignment.stretch'),
              trailing: Radio(
                value: 'CrossAxisAlignment.stretch',
                groupValue: _response,
                onChanged: (value) {
                  setState(() {
                    _response = value!;
                    crossAxisAlignment = CrossAxisAlignment.stretch;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('CrossAxisAlignment.center'),
              trailing: Radio(
                value: 'CrossAxisAlignment.center',
                groupValue: _response,
                onChanged: (value) {
                  setState(() {
                    _response = value!;
                    crossAxisAlignment = CrossAxisAlignment.center;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
