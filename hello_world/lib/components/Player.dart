import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flappybird/FlappyBird.dart';

class Player {
  Rect playerRect;
  final FlappyBird game;
  bool jumping;
  int jumpTime;
  List<Sprite> flyingSprite;
  double flyingSpriteIndex = 0;

  Player(this.game, double x, double y) {
    playerRect = Rect.fromLTWH(x, y, game.tileSize * 2, game.tileSize * 2);

    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('redbird-downflap.png'));
    flyingSprite.add(Sprite('redbird-midflap.png'));
    flyingSprite.add(Sprite('redbird-upflap.png'));

    this.jumping = false;
    this.jumpTime = 0;
  }

  void render(Canvas c) {
    flyingSprite[flyingSpriteIndex.toInt()].renderRect(c, playerRect);
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

    flyingSpriteIndex += 20 * t;
    if (flyingSpriteIndex >= 3) {
      flyingSpriteIndex -= 3;
    }
  }

  void jump() {
    this.jumping = true;
  }
}
