import 'package:audioplayers/audioplayers.dart';
import 'package:dash_vs_bug/game/game.dart';
import 'package:dash_vs_bug/gen/assets.gen.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class TappingBehavior extends Behavior<Unicorn>
    with TapCallbacks, HasGameRef<DashVsBug> {
  @override
  bool containsLocalPoint(Vector2 point) {
    return parent.containsLocalPoint(point);
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (parent.isAnimationPlaying()) {
      return;
    }
    gameRef.counter++;
    parent.playAnimation();

    gameRef.effectPlayer.play(AssetSource(Assets.audio.effect));
  }
}
