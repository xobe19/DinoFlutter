import 'package:flutter/material.dart';

class PlayerScoreLayer extends StatelessWidget {
  int score = 0;
  PlayerScoreLayer(score) {
    this.score = score;
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Text("Score: ${score}", style: TextStyle(fontSize: 30)),
      alignment: Alignment.topCenter,
    );
  }
}
