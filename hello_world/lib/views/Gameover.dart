import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flappybird/FlappyBird.dart';

class Gameover {
  final FlappyBird game;
  Rect spriteRect;
  Sprite sprite;

  Gameover(this.game) {
    this.spriteRect = Rect.fromLTWH(
        this.game.tileSize * 5,
        this.game.tileSize * 15,
        this.game.screenSize.width - this.game.tileSize * 10,
        this.game.screenSize.height - this.game.tileSize * 29);

    this.sprite = new Sprite('gameover.png');
  }

  void render(Canvas c) {
    this.sprite.renderRect(c, this.spriteRect);
  }

  void update(double t) {}
}
