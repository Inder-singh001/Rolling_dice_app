// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:math';

class double_dice extends StatefulWidget {
  const double_dice({super.key});

  @override
  State<double_dice> createState() => _double_diceState();
}

class _double_diceState extends State<double_dice>
    with TickerProviderStateMixin {
  var leftdicenum = 1;
  var rightdicenum = 1;
  // var currentTabIndex = 0;

  void roll() {
    setState(() {
      leftdicenum = Random().nextInt(6) + 1;
      rightdicenum = Random().nextInt(6) + 1;
      _controller.forward(from: 0.0);
    });
  }

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double pixelratio = MediaQuery.of(context).devicePixelRatio;
    double padding = pixelratio * 8;
    double size = 180;

    return Scaffold(
      backgroundColor: const Color.fromARGB(219, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 124, 91),
        title: const Center(
          child: Text(
            'Rolling Dice',
            style: TextStyle(fontSize: 28),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size,
                  height: size,
                  padding: EdgeInsets.all(padding),
                  child: RotationTransition(
                      turns: _animation,
                      child:
                          Image.asset('assets/images/dice-$leftdicenum.png')),
                ),
                Container(
                    width: size,
                    height: size,
                    padding: EdgeInsets.all(padding),
                    child: RotationTransition(
                        turns: _animation,
                        child: Image.asset(
                            'assets/images/dice-$rightdicenum.png'))),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(padding * 2),
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 31, 124, 91),
                  ),
                  onPressed: roll,
                  child: const Text(
                    'Roll',
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                children: [
                  const Text(
                    'Total Count',
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(44, 140, 141, 140),
                              spreadRadius: 10.0,
                              blurRadius: 10.0,
                            )
                          ],
                          color: Color.fromARGB(255, 244, 244, 244),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: const Center(child: Text('count')),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
