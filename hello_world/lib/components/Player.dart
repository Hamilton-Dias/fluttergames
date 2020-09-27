import 'dart:ui';
import 'package:flame/anchor.dart';
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flappybird/FlappyBird.dart';
import 'package:flappybird/components/Background.dart';

import 'Pipes.dart';

class Player extends Component {
  final FlappyBird game;
  final GRAVITY = 400.0;
  final BOOST = -300.0;
  List<Sprite> flyingSprite;
  AnimationComponent playerAnimated;
  double speedY;

  Player(this.game, double x, double y) {
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('redbird-downflap.png'));
    flyingSprite.add(Sprite('redbird-midflap.png'));
    flyingSprite.add(Sprite('redbird-upflap.png'));

    this.playerAnimated = AnimationComponent(
        game.tileSize * 2,
        game.tileSize * 2,
        new Animation.spriteList(flyingSprite, stepTime: 0.1));

    this.initialize(x, y);
  }

  void initialize(double x, double y) {
    this.playerAnimated.x = x;
    this.playerAnimated.y = y;
    this.playerAnimated.anchor = Anchor.center;

    this.speedY = 0.0;
    this.playerAnimated.angle = 0;
  }

  Position get velocity => Position(300.0, this.speedY);

  @override
  void render(Canvas c) {
    playerAnimated.render(c);
  }

  @override
  void update(double t) {
    if (game.gamePaused) return;

    playerAnimated.y += this.speedY * t - GRAVITY * t * t / 2;
    this.speedY += GRAVITY * t;

    if (playerAnimated.y > game.screenSize.height) {
      game.gameOver();
    }

    if (playerAnimated.y < this.game.tileSize)
      playerAnimated.y = this.game.tileSize;

    playerAnimated.angle = velocity.angle();
    playerAnimated.update(t);

    checkCollisions();
  }

  void onTap() {
    this.speedY = BOOST;
  }

  void checkCollisions() {
    for (var component in this.game.components) {
      if (component is Player || component is Background) continue;

      Pipes currPipe = component;

      //Colisão com os canos superiores
      if (playerAnimated.x - game.tileSize < currPipe.upperPipeCollidor.right &&
          playerAnimated.x - game.tileSize + playerAnimated.width >
              currPipe.upperPipeCollidor.left &&
          playerAnimated.y - game.tileSize <
              currPipe.upperPipeCollidor.bottom &&
          playerAnimated.y - game.tileSize + playerAnimated.height >
              currPipe.upperPipeCollidor.top) {
        this.game.gameOver();
      }

      //Colisão com os canos inferioes
      if (playerAnimated.x - game.tileSize < currPipe.lowerPipeCollidor.right &&
          playerAnimated.x - game.tileSize + playerAnimated.width >
              currPipe.lowerPipeCollidor.left &&
          playerAnimated.y - game.tileSize <
              currPipe.lowerPipeCollidor.bottom &&
          playerAnimated.y - game.tileSize + playerAnimated.height >
              currPipe.lowerPipeCollidor.top) {
        this.game.gameOver();
      }
    }
  }
}
