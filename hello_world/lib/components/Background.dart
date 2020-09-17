import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

class Background extends Component {
  Sprite bgSprite;
  Rect bgRect;

  Background(Size size) {
    bgSprite = Sprite('background-day.png');
    bgRect = Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height,
    );
  }

  @override
  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  @override
  void update(double t) {}
}
