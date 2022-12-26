import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wrapper/models/user_summary.dart';

class DiversePortfolioStatement extends StatelessWidget {
  const DiversePortfolioStatement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final investedIn = context.read<UserSummary>().investedIn;
    final String investedString;
    if (investedIn.length > 2) {
      investedString =
          '${investedIn.take(investedIn.length - 1).join(', ')} and ${investedIn.last}';
    } else if (investedIn.length == 2) {
      investedString = investedIn.join(' and ');
    } else {
      investedString = investedIn.join();
    }

    return Column(
      children: [
        Text(
          'You have maintained a diverse portfolio with',
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 14,
              height: 19.6 / 14,
            ),
          ),
        ),
        Text(
          investedString,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 16,
              height: 19.6 / 16,
            ),
          ),
        ),
      ],
    );
  }
}
