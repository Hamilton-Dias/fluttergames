import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flappybird/FlappyBird.dart';

class Background {
  final FlappyBird game;
  Sprite bgSprite;
  Rect bgRect;

  Background(this.game) {
    bgSprite = Sprite('background-day.png');
    bgRect = Rect.fromLTWH(
      0,
      0,
      game.screenSize.width,
      game.screenSize.height,
    );
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}
