import 'dart:async';
import 'dart:ui';
import 'dart:math';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flappybird/View.dart';
import 'package:flappybird/views/Home.dart';
import 'package:flappybird/views/Gameover.dart';
import 'package:flappybird/components/Player.dart';
import 'package:flappybird/components/Pipes.dart';
import 'package:flappybird/components/Background.dart';
import 'package:flappybird/components/Score.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlappyBird extends BaseGame with TapDetector {
  Size screenSize;
  double tileSize;
  Player player;
  bool gamePaused;
  Timer timer;
  View view;
  Home home;
  Gameover gameover;
  Score score;
  final SharedPreferences storage;

  FlappyBird(Size size, this.storage) {
    this.initialize(size);
    add(Background(this.screenSize));
    add(player = Player(this, screenSize.width / 3, screenSize.height / 2));
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) => generatePipe());
  }

  void initialize(Size size) {
    this.gamePaused = true;
    this.screenSize = size;
    this.tileSize = this.screenSize.width / 18;
    this.view = View.home;
    this.home = new Home(this);
    this.gameover = new Gameover(this);
    this.score = new Score(this);
  }

  void render(Canvas c) {
    super.render(c);

    if (this.view == View.home) this.home.render(c);
    if (this.view == View.gameover) this.gameover.render(c);
    if (this.view != View.home) this.score.render(c);
  }

  void update(double t) {
    super.update(t);

    this.score.update(t);
  }

  @override
  void onTap() {
    if (this.gamePaused) {
      this.gamePaused = false;
      this.view = View.playing;
      this.gameReset();
      return;
    }

    player.onTap();
  }

  void gameOver() {
    this.view = View.gameover;
    this.gamePaused = true;
  }

  void generatePipe() {
    if (!gamePaused) {
      var rng = new Random();
      int height = rng.nextInt(13) + 5;
      add(Pipes(this, tileSize * height));
    }
  }

  void gameReset() {
    this.score.score = 0;
    player.initialize(screenSize.width / 3, screenSize.height / 2);

    for (var component in this.components) {
      if (component is Pipes) markToRemove(component);
    }
  }
}
