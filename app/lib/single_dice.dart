// ignore_for_file: camel_case_types, deprecated_member_use, unused_field

// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'dart:math';

class single_dice extends StatefulWidget {
  const single_dice({super.key});

  @override
  State<single_dice> createState() => _single_diceState();
}

class _single_diceState extends State<single_dice>
    with TickerProviderStateMixin {
  int dicenum = 1;

  void roll() {
    setState(() {
      dicenum = Random().nextInt(6) + 1;
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
                  width: 250,
                  height: 250,
                  padding: const EdgeInsets.all(12.0),
                  // margin: const EdgeInsets.all(15.0),
                  child: RotationTransition(
                      turns: _animation,
                      child: Image.asset('assets/images/dice-$dicenum.png')),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
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
          ],
        ),
      ),
    );
  }
}
