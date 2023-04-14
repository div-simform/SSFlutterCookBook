import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true, ),
      home: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return true;
        },
        child: _MyState(),
      ),
    );
  }
}

class _MyState extends StatefulWidget {
  const _MyState({Key? key}) : super(key: key);

  @override
  State<_MyState> createState() => _MyStateState();
}

class _MyStateState extends State<_MyState> {
  RangeValues values = RangeValues(0, 50);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stack Widget'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.purple,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0))),
            ),
            Positioned(
              top: values.start,
              left: values.end,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26.0),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/img.jpeg',
                  scale: 2.8,
                ),
              ),
            ),
            Container(
              child: RangeSlider(
                  values: values,
                  divisions: 10,
                  min: 0,
                  labels: RangeLabels("Positioned Top-Bottom", "Positioned Left-Right"),
                  max: 50,
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,
                  onChanged: (data) {
                    values = data;
                    setState(() {});
                    print(values);
                  }),
            )
          ],
        ));
  }
}
