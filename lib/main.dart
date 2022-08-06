import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text("Dice Roller"),
          backgroundColor: Colors.blue.shade400,
        ),
        body: SafeArea(
          child: DicePage(),
        ),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 1;

  int getRandomNumber() {
    Random rnd = Random.secure();
    int randomValue = rnd.nextInt(6);

    randomValue += 1;

    return randomValue;
  }

  void roll() {
    int left = getRandomNumber();
    int right = getRandomNumber();

    setState(() {
      leftDice = left;
      rightDice = right;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: roll,
              child: Image.asset(
                "images/dice$leftDice.png",
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: roll,
              child: Image.asset("images/dice$rightDice.png"),
            ),
          ),
        ],
      ),
    );
  }
}
