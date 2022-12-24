import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:wrapper/components/diverse_portfolio_statement.dart';
import 'package:wrapper/generated/assets.gen.dart';

class Story2 extends StatelessWidget {
  const Story2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: -50,
          left: 0,
          right: 0,
          child: Image.asset(
            Assets.images.story2Background.path,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 62.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(Assets.images.cherryLogo.path),
              const SizedBox(height: 55),
              Text(
                'Your portfolio looks',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 18,
                    height: 22.4 / 18,
                  ),
                ),
              ).animate().fadeIn(duration: 700.milliseconds).scale().slideY(
                    begin: 1,
                    end: 0,
                  ),
              const SizedBox(height: 20),
              Text(
                'CHERRY',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40,
                    height: 38 / 40,
                  ),
                ),
              )
                  .animate(delay: 550.milliseconds)
                  .fadeIn(duration: 750.milliseconds)
                  .move(begin: const Offset(0, -50), end: Offset.zero)
                  .scale(),
              Text(
                'TASTIC!',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40,
                    height: 38 / 40,
                  ),
                ),
              )
                  .animate(delay: 500.milliseconds)
                  .fadeIn(duration: 700.milliseconds)
                  .move(begin: const Offset(0, -50), end: Offset.zero)
                  .scale(),
              const SizedBox(height: 16),
              const DiversePortfolioStatement()
                  .animate()
                  .fadeIn(delay: 1200.milliseconds, duration: 500.milliseconds),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: LottieBuilder.asset(
            Assets.lottie.story2PieIllustration,
            repeat: false,
          ),
        ),
      ],
    );
  }
}
