import 'package:flutter/material.dart';

class CactusLayer extends StatelessWidget {
  double cactus_x = 1.5, cactus_y = 0;

  CactusLayer(double cactus_x, double cactus_y) {
    this.cactus_x = cactus_x;
    this.cactus_y = cactus_y;
  }

  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/images/cactus.png"),
      alignment: Alignment(cactus_x, cactus_y),
    );
  }
}
