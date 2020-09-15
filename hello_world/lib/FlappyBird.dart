import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flappybird/components/Player.dart';

class FlappyBird extends Game {
  Size screenSize;
  double tileSize;
  Player player;
  bool startGame;

  FlappyBird() {
    this.initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    player = new Player(this, screenSize.width / 3, screenSize.height / 2);
    this.startGame = false;
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
    player.render(canvas);
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
