import 'dart:async';
import 'dart:ui';
import 'dart:math';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flappybird/components/Player.dart';
import 'package:flappybird/components/Pipes.dart';
import 'package:flappybird/components/Background.dart';

class FlappyBird extends BaseGame with TapDetector {
  Size screenSize;
  double tileSize;
  Player player;
  bool gamePaused;
  Timer timer;

  FlappyBird(Size size) {
    this.initialize(size);
    add(Background(this.screenSize));
    add(player = Player(this, screenSize.width / 3, screenSize.height / 2));
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) => generatePipe());
    //this.generatePipe();
  }

  void initialize(Size size) {
    this.gamePaused = true;
    this.screenSize = size;
    this.tileSize = this.screenSize.width / 18;
  }

  @override
  void onTap() {
    if (this.gamePaused) {
      this.gamePaused = false;
      return;
    }

    player.onTap();
  }

  void gameOver() {
    this.gamePaused = true;
  }

  void generatePipe() {
    var rng = new Random();
    int height = rng.nextInt(13) + 5;
    add(Pipes(this, tileSize * height));
  }
}
