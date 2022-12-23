import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:wrapper/generated/assets.gen.dart';

class Story3 extends StatelessWidget {
  const Story3({super.key});

  static const normalTextColor = Color(0xFF2A3450);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          Assets.images.story3Background.path,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 62.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(Assets.images.cherryLogoColored.path),
              const SizedBox(height: 55),
              // TODO: Animate texts
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'You were one of the',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: normalTextColor,
                        fontSize: 16,
                        height: 22.4 / 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'TOP 3%',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF943335),
                        fontSize: 60,
                        height: 38 / 60,
                      ),
                    ),
                  ),
                  Text(
                    'INVESTORS IN CHERRY!',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: normalTextColor,
                        fontSize: 14,
                        height: 22.4 / 14,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: LottieBuilder.asset(
            Assets.lottie.story3Character,
            repeat: false,
          ),
        ),
      ],
    );
  }
}
