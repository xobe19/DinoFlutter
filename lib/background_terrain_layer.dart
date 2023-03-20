import 'package:flutter/material.dart';

class BackgroundTerrainLayer extends StatelessWidget {
  double terrain_x = 0;

  BackgroundTerrainLayer(double terrain_x) {
    this.terrain_x = terrain_x;
  }

  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 20,
        child: Image.asset("assets/images/ground.png",
            fit: BoxFit.fitHeight, alignment: Alignment(terrain_x % 1.1, 0)),
      ),
      alignment: Alignment(0, 0.125),
    );
  }
}
