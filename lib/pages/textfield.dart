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
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
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
      body: _textFormField(),
    );
  }

  Widget _textFormField() {
    return Form(
      key: _globalKey,
      onChanged: () {
        print('changed');
      },
      child: Center(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Required';
                  } else if (value.length < 6) {
                    return 'Must be 6 digits';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.characters,
                controller: _textEditingController,
                onChanged: (value) {
                  setState(() {
                    s = value;
                  });
                },
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.add),
                  suffixText: 'Hi',
                  label: Icon(Icons.email),
                  suffixIcon: Icon(Icons.remove_red_eye_sharp),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              OutlinedButton(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      print('TRUE');
                    } else {
                      print('false');
                    }
                  },
                  child: Text('Click'))
            ],
          ),
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
