import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:wrapper/generated/assets.gen.dart';
import 'package:wrapper/models/user_summary.dart';

class Story3 extends StatelessWidget {
  const Story3({super.key});

  static const normalTextColor = Color(0xFF2A3450);

  @override
  Widget build(BuildContext context) {
    final summary = context.read<UserSummary>();
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: -60,
          left: 0,
          right: 0,
          child: Image.asset(
            Assets.images.story3Background.path,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 62.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(Assets.images.cherryLogoColored.path),
              const SizedBox(height: 55),
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
              ).animate().fadeIn(duration: 1.seconds),
              const SizedBox(height: 30),
              Text(
                "TOP ${summary.topPercent ?? ''}%",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF943335),
                    fontSize: 60,
                    height: 38 / 60,
                  ),
                ),
              ).animate().fadeIn(duration: 1.seconds).slideY(
                    begin: -1,
                    end: 0,
                    curve: Curves.easeInOut,
                    duration: 500.milliseconds,
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
              ).animate().fadeIn(duration: 1.seconds),
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
