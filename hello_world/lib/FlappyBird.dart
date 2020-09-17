import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flappybird/components/Player.dart';
import 'package:flappybird/components/Pipes.dart';
import 'package:flappybird/components/Background.dart';

class FlappyBird extends BaseGame {
  Size screenSize;
  double tileSize;
  Player player;
  Pipes pipes;
  bool startGame;
  Background background;

  FlappyBird() {
    this.initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    player = new Player(this, screenSize.width / 3, screenSize.height / 2);
    background = Background(this);
    pipes = new Pipes(this, 50.0, 20.0);
    this.startGame = false;
  }

  void render(Canvas canvas) {
    background.render(canvas);

    player.render(canvas);
    pipes.render(canvas);
  }

  void update(double t) {
    if (this.startGame) {
      player.update(t);
    }
  }

  void resize(Size size) {
    this.screenSize = size;
    this.tileSize = screenSize.width / 18;
  }

  void onTapDown(TapDownDetails d) {
    if (!this.startGame) {
      this.startGame = true;
    }
    player.jump();
  }
}
