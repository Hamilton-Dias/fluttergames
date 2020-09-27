import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/flame.dart';
import 'package:flappybird/FlappyBird.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences storage = await SharedPreferences.getInstance();

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  Size size = await Flame.util.initialDimensions();

  Flame.images.loadAll(<String>[
    '0.png',
    '1.png',
    '2.png',
    '3.png',
    '4.png',
    '5.png',
    '6.png',
    '7.png',
    '8.png',
    '9.png',
    'background-day.png',
    'gameover.png',
    'message.png',
    'pipe-green.png',
    'pipe-green-down.png',
    'redbird-downflap.png',
    'redbird-midflap.png',
    'redbird-upflap.png'
  ]);

  FlappyBird game = new FlappyBird(size, storage);
  runApp(game.widget);
}
