import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:wrapper/generated/assets.gen.dart';

class Story6 extends StatefulWidget {
  const Story6({super.key});

  @override
  State<Story6> createState() => _Story6State();
}

class _Story6State extends State<Story6> with TickerProviderStateMixin {
  late AnimationController _logoAnimator;
  late AnimationController _bottomIllustrationAnimator;

  @override
  void initState() {
    _logoAnimator = AnimationController(vsync: this);
    _animateLogo();

    _bottomIllustrationAnimator = AnimationController(vsync: this);
    _animateBottomIllustration();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          Assets.images.story1Background.path,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: -44,
          left: 0,
          right: 0,
          child: LottieBuilder.asset(
            Assets.lottie.confettiDangler,
            repeat: false,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.2,
          left: 0,
          right: 0,
          child: LottieBuilder.asset(
            Assets.lottie.cherryLogoAnimation,
            onLoaded: (composition) =>
                _logoAnimator.duration = composition.duration,
            controller: _logoAnimator,
            repeat: false,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.2 + 80,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 62.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Thank you!',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40,
                      height: 38 / 40,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'For investing with Cherry',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 12,
                      height: 19.6 / 12,
                    ),
                  ),
                ),
                Text(
                  'since 21 March, 2019',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontSize: 14,
                      height: 19.6 / 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: LottieBuilder.asset(
            Assets.lottie.story6Illustration,
            controller: _bottomIllustrationAnimator,
            onLoaded: (composition) =>
                _bottomIllustrationAnimator.duration = composition.duration,
            repeat: false,
          ),
        ),
      ],
    );
  }

  Future<void> _animateLogo() async {
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) {
      return;
    }
    _logoAnimator.forward();
  }

  Future<void> _animateBottomIllustration() async {
    await Future.delayed(const Duration(seconds: 4));
    if (!mounted) {
      return;
    }
    _bottomIllustrationAnimator.forward();
  }
}
