import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:wrapper/generated/assets.gen.dart';
import 'package:wrapper/models/user_summary.dart';

enum Story4Type {
  explorer,
  defender,
  adventurer,
}

class Story4 extends StatelessWidget {
  const Story4({super.key});

  static const normalTextColor = Color(0xFF2A3450);

  @override
  Widget build(BuildContext context) {
    final summary = context.read<UserSummary>();
    Story4Type storytype;
    String title;
    String suffix;
    switch (summary.personality) {
      case 'defender':
        storytype = Story4Type.defender;
        title = 'DEFENDER';
        suffix = 'a';
        break;
      case 'explorer':
        storytype = Story4Type.explorer;
        title = 'EXPLORER';
        suffix = 'an';
        break;
      case 'adventurer':
        storytype = Story4Type.adventurer;
        title = 'ADVENTURER';
        suffix = 'an';
        break;
      default:
        storytype = Story4Type.defender;
        title = 'DEFENDER';
        suffix = 'a';
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          Assets.images.story4Background.path,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(Assets.images.cherryLogo.path),
              const SizedBox(height: 55),
              Text(
                'You are $suffix',
                textAlign: TextAlign.center,
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
              AutoSizeText(
                title,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 50,
                    height: 38 / 50,
                  ),
                ),
              )
                  .animate(delay: 500.milliseconds)
                  .fadeIn(duration: 700.milliseconds)
                  .move(begin: const Offset(0, -50), end: Offset.zero)
                  .scale(),
              const SizedBox(height: 16),
              if (summary.equityExposure != null)
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'You have ',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 14,
                        height: 19.6 / 14,
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: summary.equityExposure!,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14,
                            height: 19.6 / 14,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: ' exposure in equity',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 14,
                            height: 19.6 / 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(
                    delay: 1200.milliseconds, duration: 500.milliseconds),
            ],
          ),
        ),
        if (storytype == Story4Type.defender) const DefenderIllustrations(),
        if (storytype == Story4Type.explorer) const ExplorerIllustrations(),
        if (storytype == Story4Type.adventurer) const AdventurerIllustrations(),
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
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.2,
          left: 0,
          right: 0,
          child: LottieBuilder.asset(
            Assets.lottie.story4ExplorerClouds,
            repeat: false,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            Assets.images.story4ExplorerLeftTree.path,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Row(
            children: [
              Image.asset(
                Assets.images.story4ExplorerDarkStone.path,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 20,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.4),
            child: Image.asset(
              Assets.images.story4ExplorerCharacter.path,
            ),
          ),
        ).animate().slideX(
              duration: 500.milliseconds,
              curve: Curves.easeInSine,
              begin: -1,
              end: 0,
            ),
        Positioned(
          bottom: 0,
          right: -80,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.4),
            child: Image.asset(
              Assets.images.story4ExplorerFrontTree.path,
            ),
          ),
        ),
      ],
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
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        child: LottieBuilder.asset(
          Assets.lottie.story4AdventurerIllustration,
          repeat: false,
        ),
      ),
    );
  }
}
