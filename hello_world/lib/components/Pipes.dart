/*import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flappybird/FlappyBird.dart';

class Pipes {
  final FlappyBird game;
  Rect upperPipeCollidor;
  Rect lowerPipeCollidor;
  bool isOffScreen;
  Sprite upperPipe;
  Sprite lowerPiper;

  Pipes(this.game, double upperHeight, double lowerHeight) {
    //  TODO: lembrar que o zero é em cima!!!
    this.isOffScreen = false;

    upperPipeCollidor = Rect.fromLTWH(
        0, game.screenSize.height, -upperHeight, game.tileSize * 4);
    //lowerPipeCollidor = Rect.fromLTWH(0, 0, lowerHeight, game.tileSize * 4);

    upperPipe = new Sprite('pipe-green.png');
    //lowerPiper = new Sprite('pipe-green.png');
  }

  void render(Canvas c) {
    upperPipe.renderRect(c, upperPipeCollidor);
    //lowerPiper.renderRect(c, lowerPipeCollidor);
  }

  void update(double t) {}
}*/
