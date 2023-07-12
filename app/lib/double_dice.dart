// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:math';

class double_dice extends StatefulWidget {
  const double_dice({super.key});

  @override
  State<double_dice> createState() => _double_diceState();
}

class _double_diceState extends State<double_dice> {
  var leftdicenum = 1;
  var rightdicenum = 1;
  var currentTabIndex = 0;

  void roll() {
    setState(() {
      leftdicenum = Random().nextInt(6) + 1;
      rightdicenum = Random().nextInt(6) + 1;
    });
  }

  void onTapbutton(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(219, 163, 241, 239),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 79, 45, 250),
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
                  width: 180,
                  height: 180,
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/dice-$leftdicenum.png'),
                ),
                Container(
                    width: 180,
                    height: 180,
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/dice-$rightdicenum.png')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 79, 45, 250),
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
