import 'package:flutter/material.dart';

class StartButtonLayer extends StatelessWidget {
  Function startTimer = () {};

  StartButtonLayer(Function startTimer) {
    this.startTimer = startTimer;
  }

  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            startTimer();
          },
          child: Text("Start")),
      alignment: Alignment.bottomCenter,
    );
  }
}
