import 'dart:ui';
import 'package:flappybird/FlappyBird.dart';

class Player {
  Rect playerRect;
  Paint playerPaint;
  final FlappyBird game;
  bool jumping;
  int jumpTime;

  Player(this.game, double x, double y) {
    playerRect = Rect.fromLTWH(x, y, game.tileSize * 2, game.tileSize * 2);
    playerPaint = Paint();
    playerPaint.color = Color(0xff6ab04c);
    this.jumping = false;
    this.jumpTime = 0;
  }

  void render(Canvas c) {
    c.drawRect(playerRect, playerPaint);
  }

  void update(double t) {
    if (jumping) {
      playerRect = playerRect.translate(0, -game.tileSize * 12 * t);
      if (playerRect.top < 0) {
        playerRect = playerRect.translate(0, -playerRect.top);
      }
      this.jumpTime++;
      if (jumpTime > 25) {
        jumping = false;
      }
    } else {
      playerRect = playerRect.translate(0, game.tileSize * 12 * t);
      if (playerRect.bottom > game.screenSize.height) {
        playerRect =
            playerRect.translate(0, game.screenSize.height - playerRect.bottom);
      }
      jumpTime = 0;
    }
  }

  void jump() {
    this.jumping = true;
  }
}
