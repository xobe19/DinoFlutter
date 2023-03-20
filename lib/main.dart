import 'dart:async';
import 'dart:math';

import 'package:dinoflutter/background_terrain_layer.dart';
import 'package:dinoflutter/cactus_layer.dart';
import 'package:dinoflutter/dino_layer.dart';
import 'package:dinoflutter/player_score_layer.dart';
import 'package:dinoflutter/start_button_layer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyHome()));
}

class MyHome extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHome> {
  int score = 0;
  String dino_image = "assets/images/dino_stop.png";
  String dino_running_1 = "assets/images/dino_run_1.png";
  String dino_running_2 = "assets/images/dino_run_2.png";
  String dino_state = "stopped";
  String cactus_state = "off_screen";

  double dino_x = -.5, dino_y = 0;
  double cactus_x = 1.5, cactus_y = 0;

  double terrain_x = 0;

  var _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 50), (_timer) {
      if (dino_state == "stopped") {
        return;
      }

      if (dino_state == "running") {
        setState((() {
          score = score + 1;
          terrain_x += 0.1;
        }));

        if (score % 2 == 0) {
          dino_image = dino_running_1;
        } else {
          dino_image = dino_running_2;
        }
      }

      if (dino_state == "jumping_up") {
        setState(
          () {
            terrain_x += 0.1;
            dino_image = "assets/images/dino_stop.png";
            dino_y -= 0.05;
            if (dino_y <= -.5) {
              dino_state = "jumping_down";
            }
          },
        );
      }

      if (dino_state == "jumping_down") {
        setState(
          () {
            terrain_x += 0.1;
            dino_image = "assets/images/dino_stop.png";
            dino_y += 0.05;
            if (dino_y >= 0) {
              dino_state = "running";
            }
          },
        );
      }

      if (cactus_state == "off_screen") {
        var r = Random();
        double prob = r.nextDouble();
        bool succ = prob <= 0.3;

        if (succ) {
          setState(() {
            cactus_state = "on_screen";
          });
        }
      }

      if (cactus_state == "on_screen") {
        setState(() {
          cactus_x -= 0.1;

          if (cactus_x <= -1.5) {
            cactus_state = "off_screen";
            cactus_x = 1.5;
          }
        });
      }

      if (cactus_x - dino_x <= 0.1 && cactus_y - dino_y <= 0.1) {
        _timer.cancel();
      }
    });
  }

  void stopTimer() {
    // called when player loses
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dinosaur Game"),
        ),
        body: GestureDetector(
            onTap: () {
              setState(() {
                dino_state = "jumping_up";
              });
            },
            child: Stack(children: [
              BackgroundTerrainLayer(terrain_x),
              CactusLayer(cactus_x, cactus_y),
              DinoLayer(dino_image, dino_x, dino_y),
              PlayerScoreLayer(score),
              StartButtonLayer(() {
                setState(() {
                  score = 0;

                  dino_x = -.5;
                  dino_y = 0;
                  cactus_x = 1.5;
                  cactus_y = 0;

                  dino_state = "running";
                });

                startTimer();
              })
            ])));
  }
}
