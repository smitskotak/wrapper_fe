import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:wrapper/generated/assets.gen.dart';
import 'package:wrapper/models/user_summary.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(Assets.images.cherryLogoColored.path),
              const SizedBox(height: 40),
              Text(
                'You had a soft corner for',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: normalTextColor,
                    fontSize: 18,
                    height: 22.4 / 18,
                  ),
                ),
              )
                  .animate()
                  .slideY(
                    duration: 1.seconds,
                    curve: Curves.easeInSine,
                    begin: -2,
                    end: 0,
                  )
                  .fadeIn(),
              const SizedBox(height: 20),
              const FundCard(),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.6,
            ),
            child: LottieBuilder.asset(
              Assets.lottie.story5PieChart,
              repeat: false,
            ),
          ),
        ),
      ],
    );
  }
}

class FundCard extends StatelessWidget {
  const FundCard({super.key});

  @override
  Widget build(BuildContext context) {
    final summary = context.read<UserSummary>();
    final topItem = summary.topInvested;
    if (topItem == null) {
      return const SizedBox();
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xFFDEDCD6),
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F00000F),
                offset: Offset(0, 4),
                blurRadius: 8,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                // const SizedBox(height: 40),
                const SizedBox(height: 12),
                Text(
                  topItem.name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 22.4 / 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'It constitutes ',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 16.8 / 14,
                        color: Color(0xFF666666),
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: '${topItem.percent.toInt()}%',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            height: 16.8 / 14,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ),
                      const TextSpan(
                        text: ' of your portfolio.',
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ).animate().fadeIn(
              delay: 1.seconds,
              duration: 500.milliseconds,
            ),
        /* Positioned(
          top: -40,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                // TODO: Add Image below
                child: SizedBox(),
              )
                  .animate(delay: 1500.milliseconds)
                  .scale(duration: 1.seconds, curve: Curves.easeInBack),
            ],
          ),
        ), */
      ],
    );
  }
}
