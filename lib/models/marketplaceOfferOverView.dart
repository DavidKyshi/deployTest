// To parse this JSON data, do
//
//     final marketPlaceOfferOverView = marketPlaceOfferOverViewFromJson(jsonString);

import 'dart:convert';

MarketPlaceOfferOverView marketPlaceOfferOverViewFromJson(String str) => MarketPlaceOfferOverView.fromJson(json.decode(str));

String marketPlaceOfferOverViewToJson(MarketPlaceOfferOverView data) => json.encode(data.toJson());

class MarketPlaceOfferOverView {
  MarketPlaceOfferOverView({
    this.activeOffers,
    this.closedOffers,
    this.expiredOffers,
    this.withdrawnOffers,
    this.acceptedOffers,
    this.totalOffers,
    this.ngnGbpAndGbpNgnOffers,
    this.ngnUsdAndUsdNgnOffers,
    this.ngnCadAndCadNgnOffers,
  });

  double? activeOffers;
  double? closedOffers;
  double? expiredOffers;
  double? withdrawnOffers;
  double? acceptedOffers;
  double? totalOffers;
  double? ngnGbpAndGbpNgnOffers;
  double? ngnUsdAndUsdNgnOffers;
  double? ngnCadAndCadNgnOffers;

  factory MarketPlaceOfferOverView.fromJson(Map<String, dynamic> json) => MarketPlaceOfferOverView(
    activeOffers: json["active_offers"],
    closedOffers: json["closed_offers"],
    expiredOffers: json["expired_offers"],
    withdrawnOffers: json["withdrawn_offers"],
    acceptedOffers: json["accepted_offers"],
    totalOffers: json["total_offers"],
    ngnGbpAndGbpNgnOffers: json["ngn_gbp_and_gbp_ngn_offers"],
    ngnUsdAndUsdNgnOffers: json["ngn_usd_and_usd_ngn_offers"],
    ngnCadAndCadNgnOffers: json["ngn_cad_and_cad_ngn_offers"],
  );

  Map<String, dynamic> toJson() => {
    "active_offers": activeOffers,
    "closed_offers": closedOffers,
    "expired_offers": expiredOffers,
    "withdrawn_offers": withdrawnOffers,
    "accepted_offers": acceptedOffers,
    "total_offers": totalOffers,
    "ngn_gbp_and_gbp_ngn_offers": ngnGbpAndGbpNgnOffers,
    "ngn_usd_and_usd_ngn_offers": ngnUsdAndUsdNgnOffers,
    "ngn_cad_and_cad_ngn_offers": ngnCadAndCadNgnOffers,
  };
}
