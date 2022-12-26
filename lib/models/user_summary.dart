class UserSummary {
  UserSummary({
    required this.id,
    this.name,
    this.iecuId,
    required this.investedIn,
    this.topPercent,
    this.topInvested,
    required this.personality,
    this.equityExposure,
    required this.dateOfOnboarding,
    required this.urlString,
  });

  final String id;
  final String? name;
  final String? iecuId;
  final List<String> investedIn;
  final int? topPercent;
  final TopInvestedItem? topInvested;
  final String personality;
  final String? equityExposure;
  final String dateOfOnboarding;
  final String urlString;

  factory UserSummary.fromJson(Map<String, dynamic> json) => UserSummary(
        id: json["_id"],
        name: json["name"],
        iecuId: json["iecu_id"],
        investedIn: json["invested_in"] == null
            ? []
            : List<String>.from(json["invested_in"].map((x) => x)),
        topPercent: json["top_percent"],
        topInvested: json["top_invested"] == null
            ? null
            : TopInvestedItem.fromJson(json["top_invested"]),
        personality: json["personality"],
        equityExposure: json["equity_exposure"],
        dateOfOnboarding: json["date_of_onboarding"],
        urlString: json["url_string"],
      );
}

class TopInvestedItem {
  TopInvestedItem({
    required this.name,
    required this.percent,
  });

  final String name;
  final double percent;

  factory TopInvestedItem.fromJson(Map<String, dynamic> json) =>
      TopInvestedItem(
        name: json["name"],
        percent: json["percent"].toDouble(),
      );
}
