// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int randomNumber;
  // ignore: prefer_typing_uninitialized_variables
  var _userGuess;
  int attemp = 1;
  String winText = "";

  final player = AudioPlayer();

  void start() {
    setState(() {
      winText = "?????????????????????";
      attemp = 0;
      randomNumber = Random().nextInt(100) + 1;
      debugPrint(randomNumber.toString());
      player.play(AssetSource("okay.mp3"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 128, 213, 120),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Random Number Guesser',
            style: TextStyle(
              color: const Color.fromARGB(255, 238, 238, 238),
            ),
          ),
        ),
        backgroundColor: Colors.green[400],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(
                onPressed: start,
                child: Text("Start"),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    winText,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Your trys: ${attemp.toString()}",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 25.0, bottom: 25.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _userGuess = int.tryParse(value);
                });
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                hintText: "Write a number between 1 and 100",
                prefixIcon: Icon(Icons.adb),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.apple_rounded),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_userGuess != null) {
                debugPrint(_userGuess.toString());
                // _userGuess.text = ""; // Converted _userGuess to string
                setState(() {
                  if (randomNumber == _userGuess) {
                    winText = "You win!";
                    player.play(AssetSource('wow.mp3'));
                  } else if (randomNumber > _userGuess!) {
                    attemp++;
                    winText = "Too small";
                    player.play(AssetSource("laught.mp3"));
                  } else if (randomNumber < _userGuess!) {
                    attemp++;
                    winText = "Too big";

                    player.play(AssetSource('fart.mp3'));
                  } else {
                    winText = "Something went wrong";
                  }
                });
              }
            },
            child: Text("Check"),
          )
        ],
      ),
    );
  }
}
