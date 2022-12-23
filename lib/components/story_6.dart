import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:wrapper/generated/assets.gen.dart';

class Story6 extends StatelessWidget {
  const Story6({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          Assets.images.story1Background.path,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: LottieBuilder.asset(
            Assets.lottie.story1ConfettiDangler,
            repeat: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 62.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 80),
              Image.asset(Assets.images.cherryLogo.path),
              const SizedBox(height: 55),
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
        Align(
          alignment: Alignment.bottomCenter,
          child: LottieBuilder.asset(
            Assets.lottie.story6Illustration,
            repeat: false,
          ),
        ),
      ],
    );
  }
}
