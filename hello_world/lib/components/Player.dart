import 'dart:ui';
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flappybird/FlappyBird.dart';

class Player extends Component {
  Rect playerRect;
  final FlappyBird game;
  bool jumping;
  bool move;
  int jumpTime;
  List<Sprite> flyingSprite;
  double flyingSpriteIndex = 0;
  AnimationComponent playerAnimated;

  Player(this.game, double x, double y) {
    playerRect = Rect.fromLTWH(x, y, game.tileSize * 2, game.tileSize * 2);

    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('redbird-downflap.png'));
    flyingSprite.add(Sprite('redbird-midflap.png'));
    flyingSprite.add(Sprite('redbird-upflap.png'));

    this.playerAnimated = AnimationComponent(
        game.tileSize * 2,
        game.tileSize * 2,
        new Animation.spriteList(flyingSprite, stepTime: 0.1));

    this.playerAnimated.x = x;
    this.playerAnimated.y = y;

    this.move = false;
    this.jumping = false;
    this.jumpTime = 0;
  }

  @override
  void render(Canvas c) {
    playerAnimated.render(c);
  }

  @override
  void update(double t) {
    if (this.move) {
      if (jumping) {
        playerRect = playerRect.translate(0, -game.tileSize * 12 * t);
        playerAnimated.y += -game.tileSize * 12 * t;
        if (playerRect.top < 0) {
          playerRect = playerRect.translate(0, -playerRect.top);
        }
        this.jumpTime++;
        if (jumpTime > 25) {
          jumping = false;
        }
      } else {
        playerRect = playerRect.translate(0, game.tileSize * 12 * t);
        playerAnimated.y += game.tileSize * 12 * t;
        if (playerRect.bottom > game.screenSize.height) {
          playerRect = playerRect.translate(
              0, game.screenSize.height - playerRect.bottom);
        }
        jumpTime = 0;
      }

      playerAnimated.update(t);
    }
  }

  void onTap() {
    if (!this.move) {
      this.move = true;
      return;
    }
    this.jumping = true;
  }
}
