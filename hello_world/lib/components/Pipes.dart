import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flappybird/FlappyBird.dart';

class Pipes extends PositionComponent {
  final FlappyBird game;
  Rect upperPipeCollidor;
  Rect lowerPipeCollidor;
  Sprite upperPipe;
  Sprite lowerPipe;
  double speedX;

  Pipes(this.game, double height) {
    lowerPipeCollidor = Rect.fromLTWH(game.screenSize.width,
        game.screenSize.height - height, game.tileSize * 3.2, height);

    upperPipeCollidor = Rect.fromLTWH(game.screenSize.width, 0,
        game.tileSize * 3.2, game.screenSize.height - height - 250.0);

    lowerPipe = new Sprite('pipe-green.png');
    upperPipe = new Sprite('pipe-green-down.png');

    this.speedX = 150.0;
  }

  void render(Canvas c) {
    upperPipe.renderRect(c, upperPipeCollidor);
    lowerPipe.renderRect(c, lowerPipeCollidor);
  }

  @override
  void update(double t) {
    if (game.gamePaused) return;

    lowerPipeCollidor = lowerPipeCollidor.translate(-this.speedX * t, 0);
    upperPipeCollidor = upperPipeCollidor.translate(-this.speedX * t, 0);

    if (this.lowerPipeCollidor.right < 0) {
      this.game.markToRemove(this);
    }
  }
}
