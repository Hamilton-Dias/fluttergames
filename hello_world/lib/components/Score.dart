import 'dart:async';
import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flappybird/FlappyBird.dart';

class Score extends Component {
  final FlappyBird game;
  int score;
  Rect unity;
  Rect ten;
  Sprite unitySprite;
  Sprite tenSprite;
  Timer timer;

  Score(this.game) {
    this.score = 0;

    timer = Timer.periodic(Duration(seconds: 2), (Timer t) => incrementScore());

    this.unity = Rect.fromLTWH(this.game.tileSize * 9, this.game.tileSize / 2,
        this.game.tileSize * 2, this.game.tileSize * 2);
    this.ten = Rect.fromLTWH(this.game.tileSize * 7, this.game.tileSize / 2,
        this.game.tileSize * 2, this.game.tileSize * 2);

    this.unitySprite = new Sprite('0.png');
    this.tenSprite = new Sprite('0.png');
  }

  @override
  void render(Canvas c) {
    this.unitySprite.renderRect(c, this.unity);
    this.tenSprite.renderRect(c, this.ten);
  }

  @override
  void update(double t) {
    int unidade = this.score;
    int dezena = 0;

    if (this.score > 9) {
      unidade = this.score % 10;
      dezena = (this.score / 10).toInt();
    }

    this.unitySprite = new Sprite(unidade.toString() + '.png');
    this.tenSprite = new Sprite(dezena.toString() + '.png');
  }

  void incrementScore() {
    if (!this.game.gamePaused) {
      this.score++;
    }
  }
}
