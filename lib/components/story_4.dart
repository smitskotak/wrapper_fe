import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:wrapper/components/diverse_portfolio_statement.dart';
import 'package:wrapper/generated/assets.gen.dart';

class Story4 extends StatelessWidget {
  const Story4({super.key});

  static const normalTextColor = Color(0xFF2A3450);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          Assets.images.story4Background.path,
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
                    'You are an',
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
                    'EXPLORER',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 50,
                        height: 38 / 50,
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
        // const ExplorerIllustrations(),
        // const DefenderIllustrations(),
        const AdventurerIllustrations(),
      ],
    );
  }
}

class ExplorerIllustrations extends StatelessWidget {
  const ExplorerIllustrations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.45,
      child: LottieBuilder.asset(
        Assets.lottie.story4ExplorerClouds,
        repeat: false,
      ),
    );
  }
}

class DefenderIllustrations extends StatelessWidget {
  const DefenderIllustrations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: LottieBuilder.asset(
            Assets.lottie.story4DefenderTempleTree,
            repeat: false,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: LottieBuilder.asset(
            Assets.lottie.story4DefenderCharacter,
            repeat: false,
          ),
        ),
      ],
    );
  }
}

class AdventurerIllustrations extends StatelessWidget {
  const AdventurerIllustrations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: LottieBuilder.asset(
        Assets.lottie.story4AdventurerIllustration,
        repeat: false,
      ),
    );
  }
}
