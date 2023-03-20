import 'package:flutter/material.dart';

class DinoLayer extends StatelessWidget {
  String dino_image = "";
  double dino_x = -.5, dino_y = 0;

  DinoLayer(dino_image, dino_x, dino_y) {
    this.dino_image = dino_image;
    this.dino_x = dino_x;
    this.dino_y = dino_y;
  }

  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(dino_image),
      alignment: Alignment(dino_x, dino_y),
    );
  }
}
