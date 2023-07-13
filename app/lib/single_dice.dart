// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:math';

class single_dice extends StatefulWidget {
  const single_dice({super.key});

  @override
  State<single_dice> createState() => _single_diceState();
}

class _single_diceState extends State<single_dice> {
  int dicenum = 1;

  void roll() {
    setState(() {
      dicenum = Random().nextInt(6) + 1;
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
                  width: 250,
                  height: 250,
                  padding: const EdgeInsets.all(12.0),
                  // margin: const EdgeInsets.all(15.0),
                  child: Image.asset('assets/images/dice-$dicenum.png'),
                ),
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
