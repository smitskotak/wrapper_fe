import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:wrapper/generated/assets.gen.dart';

class Story5 extends StatelessWidget {
  const Story5({super.key});

  static const normalTextColor = Color(0xFF273452);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          Assets.images.story5Background.path,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 62.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(Assets.images.cherryLogoColored.path),
              const SizedBox(height: 55),
              Text(
                'You had a soft corner for',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: normalTextColor,
                    fontSize: 18,
                    height: 22.4 / 18,
                  ),
                ),
              ),
              // TODO: Card for fund
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: LottieBuilder.asset(
            Assets.lottie.story5PieChart,
            repeat: false,
          ),
        ),
      ],
    );
  }
}
