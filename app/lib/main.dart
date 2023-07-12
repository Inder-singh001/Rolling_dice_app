// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:rolling_dice/double_dice.dart';
import 'package:rolling_dice/single_dice.dart';
// import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'rolling_dice',
        home: Myhomepage());
  }
}

// ignore: must_be_immutable
class Myhomepage extends StatefulWidget {
  const Myhomepage({
    super.key,
  });

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(219, 163, 241, 239),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 79, 45, 250),
        title: Center(
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
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        border: Border.all(
                            strokeAlign: BorderSide.strokeAlignOutside,
                            style: BorderStyle.solid,
                            width: 10.0,
                            color: Color.fromARGB(44, 38, 37, 39)),
                      ),
                      margin: EdgeInsets.all(15.0),
                      padding: EdgeInsets.all(8.0),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/images/dice.png'),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => single_dice()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          border: Border.all(
                              strokeAlign: BorderSide.strokeAlignOutside,
                              style: BorderStyle.solid,
                              width: 10.0,
                              color: Color.fromARGB(44, 38, 37, 39)),
                        ),
                        margin: EdgeInsets.all(15.0),
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('assets/images/dice_double.png'),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => double_dice()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                'Choose your Dice!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    decorationColor: Color.fromARGB(202, 37, 95, 255)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
