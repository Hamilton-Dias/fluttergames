import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flappybird/components/Player.dart';
//import 'package:flappybird/components/Pipes.dart';
import 'package:flappybird/components/Background.dart';

class FlappyBird extends BaseGame with TapDetector {
  Size screenSize;
  double tileSize;
  Player player;

  FlappyBird(Size size) {
    this.initialize(size);
    add(Background(this.screenSize));
    add(player = Player(this, screenSize.width / 3, screenSize.height / 2));
  }

  void initialize(Size size) {
    this.screenSize = size;
    this.tileSize = this.screenSize.width / 18;
  }

  @override
  void onTap() {
    player.onTap();
  }
}
