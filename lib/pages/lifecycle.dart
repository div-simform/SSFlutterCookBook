import 'package:flutter/material.dart';

class FlutterLifecycle extends StatefulWidget {
  const FlutterLifecycle({Key? key}) : super(key: key);

  @override
  State<FlutterLifecycle> createState() {
    print('Constructor Called');
    return _FlutterLifecycleState();
  }
}

class _FlutterLifecycleState extends State<FlutterLifecycle> {
  bool isDark = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init method called');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('DidChangeDependencies Called');
  }

  @override
  Widget build(BuildContext context) {
    print('Build Method called');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              IconButton(
                onPressed: () {
                  setState(
                    () {
                      isDark = !isDark;
                    },
                  );
                },
                icon: Icon(
                  isDark ? Icons.light_mode : Icons.dark_mode,
                  color: isDark ? Colors.white : Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant FlutterLifecycle oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('DidUpdated Widget');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('Deactivated');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('Disposed');
  }
}
