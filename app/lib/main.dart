// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, unused_field

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

class _MyhomepageState extends State<Myhomepage> with TickerProviderStateMixin {
  // void setState(()){};
  // final DecorationTween decorationTween = DecorationTween(
  //     begin: BoxDecoration(
  //       color: Color(0xFFFFFFFF),
  //       border: Border.all(style: BorderStyle.none),
  //       borderRadius: BorderRadius.circular(60.0),
  //       boxShadow: const <BoxShadow>[
  //         BoxShadow(
  //           color: Color(0x66666666),
  //           blurRadius: 10.0,
  //           spreadRadius: 3.0,
  //           offset: Offset(0, 6.0),
  //         ),
  //       ],
  //     ),
  //     end: BoxDecoration(
  //       color: const Color(0xFFFFFFFF),
  //       border: Border.all(
  //         style: BorderStyle.none,
  //       ),
  //       borderRadius: BorderRadius.zero,
  //     ));

  // late final AnimationController _controller = AnimationController(
  //   vsync: this,
  //   duration: const Duration(seconds: 1),
  // )..repeat(reverse: true);

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  double _size = 150;
  // bool _large = false;
  // void _updateSize() {
  //   setState(() {
  //     _size = _large ? 250 : 150;
  //     _large = !_large;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(219, 255, 255, 255),
      drawer: NavigationDrawer(
        backgroundColor: Color.fromARGB(197, 254, 255, 255),
        children: [
          Center(
            child: ListTile(
              title: Center(
                child: Column(
                  children: [
                    Text(
                      'version',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text('v1.0.1')
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 124, 91),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rolling Dice',
                style: TextStyle(fontSize: 28),
              ),
            ],
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        double pixelratio = MediaQuery.of(context).devicePixelRatio;
        double padding = pixelratio * 8;
        //Responisiveness
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        _size = (width < height) ? width / 3 : height / 3;

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: AnimatedSize(
                      curve: Curves.elasticOut,
                      duration: Duration(seconds: 1),
                      child: Container(
                        width: _size,
                        height: _size,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius:
                              BorderRadius.all(Radius.circular(padding)),
                          border: Border.all(
                              strokeAlign: BorderSide.strokeAlignOutside,
                              style: BorderStyle.solid,
                              width: pixelratio * 4,
                              color: Color.fromARGB(44, 38, 37, 39)),
                        ),
                        margin: EdgeInsets.all(padding),
                        padding: EdgeInsets.all(padding),
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(padding / 10),
                          child: Image.asset('assets/images/dice.png'),
                        ),
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
              Center(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          width: _size,
                          height: _size,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius:
                                BorderRadius.all(Radius.circular(padding)),
                            border: Border.all(
                                strokeAlign: BorderSide.strokeAlignOutside,
                                style: BorderStyle.solid,
                                width: pixelratio * 4,
                                color: Color.fromARGB(44, 38, 37, 39)),
                          ),
                          margin: EdgeInsets.all(padding),
                          padding: EdgeInsets.all(padding),
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.all(padding / 10),
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
                padding: EdgeInsets.all(padding * 2),
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
        );
      }),
    );
  }
}
