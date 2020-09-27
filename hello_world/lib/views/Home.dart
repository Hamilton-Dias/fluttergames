import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flappybird/FlappyBird.dart';

class Home {
  final FlappyBird game;
  Rect spriteRect;
  Sprite sprite;

  Home(this.game) {
    this.spriteRect = Rect.fromLTWH(
        this.game.tileSize * 2.75,
        this.game.tileSize * 2.75,
        this.game.screenSize.width - this.game.tileSize * 6,
        this.game.screenSize.height - this.game.tileSize * 6);

    this.sprite = new Sprite('message.png');
  }

  void render(Canvas c) {
    this.sprite.renderRect(c, this.spriteRect);
  }

  void update(double t) {}
}
