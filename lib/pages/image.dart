import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red),
        home: WillPopScope(
            onWillPop: () async {
              Navigator.pop(context);
              return true;
            },
            child: _MyState()));
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
        title: Text('Image'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _imageWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _assetsImage(),
            )
          ],
        ),
      ),
    );
  }

  Widget _imageWidget() {
    return Image.network(
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
      width: 200.0,
      height: 200.0,
      errorBuilder: (context, obj, t) {
        return CupertinoActivityIndicator();
      },
    );
  }

  Widget _assetsImage() {
    return Image.asset(
      'assets/img.jpeg',
      width: 200.0,
      height: 200.0,

        errorBuilder: (context, obj, t) {
          return CupertinoActivityIndicator();
        }
    );
  }
}
