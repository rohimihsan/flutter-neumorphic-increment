import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter neumorphic increment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter neumorphic increment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isElevated = true;
  bool _resetIsElevated = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isElevated = !_isElevated;
                    });
                    _incrementCounter();

                    Timer timer =
                        new Timer(new Duration(milliseconds: 200), () {
                      setState(() {
                        _isElevated = !_isElevated;
                      });
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: _isElevated
                            ? [
                                BoxShadow(
                                    color: Colors.grey[500]!,
                                    offset: const Offset(4, 4),
                                    blurRadius: 15,
                                    spreadRadius: 1),
                                BoxShadow(
                                    color: Colors.white,
                                    offset: const Offset(-4, -4),
                                    blurRadius: 15,
                                    spreadRadius: 1)
                              ]
                            : null),
                    child: Icon(
                      Icons.add,
                      size: 70,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _resetIsElevated = !_resetIsElevated;
                      _counter = 0;
                    });

                    Timer timer =
                        new Timer(new Duration(milliseconds: 200), () {
                      setState(() {
                        _resetIsElevated = !_resetIsElevated;
                      });
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: _resetIsElevated
                            ? [
                                BoxShadow(
                                    color: Colors.grey[500]!,
                                    offset: const Offset(4, 4),
                                    blurRadius: 15,
                                    spreadRadius: 1),
                                BoxShadow(
                                    color: Colors.white,
                                    offset: const Offset(-4, -4),
                                    blurRadius: 15,
                                    spreadRadius: 1)
                              ]
                            : null),
                    child: Icon(
                      Icons.refresh,
                      size: 30,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
