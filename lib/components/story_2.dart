import 'package:flutter/material.dart';
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
        Image.asset(
          Assets.images.story2Background.path,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 62.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(Assets.images.cherryLogo.path),
              const SizedBox(height: 55),
              // TODO: Animate texts
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'CHERRY\nTASTIC!',
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
                  const DiversePortfolioStatement(),
                ],
              )
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
