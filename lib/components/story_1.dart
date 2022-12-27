import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:wrapper/generated/assets.gen.dart';

class Story1 extends StatefulWidget {
  const Story1({super.key});

  @override
  State<Story1> createState() => _Story1State();
}

class _Story1State extends State<Story1> with TickerProviderStateMixin {
  late AnimationController _confettiAnimator;
  late AnimationController _logoAnimator;
  late AnimationController _wineGlassAnimator;

  @override
  void initState() {
    _confettiAnimator = AnimationController(vsync: this);
    _animateConfetti();

    _logoAnimator = AnimationController(vsync: this);
    _animateLogo();

    _wineGlassAnimator = AnimationController(vsync: this);
    _animateWineGlasses();

    super.initState();
  }

  @override
  void dispose() {
    _confettiAnimator.dispose();
    _logoAnimator.dispose();
    _wineGlassAnimator.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: const Color(0xFF273452),
        ).animate().fadeIn(duration: 1.seconds),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  Assets.images.storay1BottomAbstract.path,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        )
            .animate()
            .fadeIn(duration: 800.milliseconds, curve: Curves.easeInOutSine)
            .slideY(begin: 1, end: 0),
        Positioned(
          top: -44,
          left: 0,
          right: 0,
          child: LottieBuilder.asset(
            Assets.lottie.confettiDangler,
            controller: _confettiAnimator,
            onLoaded: (composition) =>
                _confettiAnimator.duration = composition.duration,
            repeat: false,
          ),
        ).animate(delay: 1500.milliseconds).fadeIn(duration: 500.milliseconds),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.2,
          left: 0,
          right: 0,
          child: LottieBuilder.asset(
            Assets.lottie.story1LogoWithText,
            onLoaded: (composition) =>
                _logoAnimator.duration = composition.duration,
            controller: _logoAnimator,
            repeat: false,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.4,
            ),
            child: LottieBuilder.asset(
              Assets.lottie.story1WineGlass,
              controller: _wineGlassAnimator,
              onLoaded: (composition) =>
                  _wineGlassAnimator.duration = composition.duration,
              repeat: false,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _animateConfetti() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) {
      return;
    }
    _confettiAnimator.forward();
  }

  Future<void> _animateLogo() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (!mounted) {
      return;
    }
    _logoAnimator.forward();
  }

  Future<void> _animateWineGlasses() async {
    await Future.delayed(const Duration(seconds: 6));
    if (!mounted) {
      return;
    }
    _wineGlassAnimator.forward();
  }
}
