import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiversePortfolioStatement extends StatelessWidget {
  const DiversePortfolioStatement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'You have maintained a diverse folio with',
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
          'Stocks, Mutual funds and Bonds',
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
    );
  }
}
