import 'package:divyang_sscomposebook/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _MyState(),
    );
  }
}

class _MyState extends StatefulWidget {
  const _MyState({Key? key}) : super(key: key);

  @override
  State<_MyState> createState() => _MyStateState();
}

class _MyStateState extends State<_MyState> {
  String s = "";
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Text(s),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MyApp()),
            );
          },
          icon: const Icon(CupertinoIcons.left_chevron),
        ),
      ),
      body: _textField(),
    );
  }

  Widget _textField() {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,

              maxLength: 2,
              decoration: InputDecoration(


              ),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.characters,
              controller: _textEditingController,
              onChanged: (value) {
                setState(() {
                  s = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.add),
                suffixText: 'Hi',
                label: Icon(Icons.email),
                suffixIcon: Icon(Icons.remove_red_eye_sharp),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.clear();
    _textEditingController.dispose();
  }
}
