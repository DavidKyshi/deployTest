class ConnectData {
  ConnectData({
    this.totalConnectTransaction,
    this.totalConnectTransactionSum,
    this.kyshiConnectDataSum,
    this.kyshiConnectDataGbpSum,
    this.kyshiConnectDataUsdSum,
    this.kyshiConnectDataCadSum,
    this.kyshiConnectDataNgnSum,
  });

  int? totalConnectTransaction;
  double? totalConnectTransactionSum;
  double? kyshiConnectDataSum;
  double? kyshiConnectDataGbpSum;
  double? kyshiConnectDataUsdSum;
  double? kyshiConnectDataCadSum;
  double? kyshiConnectDataNgnSum;

  factory ConnectData.fromJson(Map<String, dynamic> json) => ConnectData(
    totalConnectTransaction: json["total_connect_transaction"] ?? 0,
    totalConnectTransactionSum: json["total_connect_transaction_sum"] ?? 0,
    kyshiConnectDataSum: json["kyshi_connect_data_sum"] ?? 0,
    kyshiConnectDataGbpSum: json["kyshi_connect_data_gbp_sum"] ?? 0,
    kyshiConnectDataUsdSum: json["kyshi_connect_data_usd_sum"] ?? 0,
    kyshiConnectDataCadSum: json["kyshi_connect_data_cad_sum"] ?? 0,
    kyshiConnectDataNgnSum: json["kyshi_connect_data_ngn_sum"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "total_connect_transaction": totalConnectTransaction,
    "total_connect_transaction_sum": totalConnectTransactionSum,
    "kyshi_connect_data_sum": kyshiConnectDataSum,
    "kyshi_connect_data_gbp_sum": kyshiConnectDataGbpSum,
    "kyshi_connect_data_usd_sum": kyshiConnectDataUsdSum,
    "kyshi_connect_data_cad_sum": kyshiConnectDataCadSum,
    "kyshi_connect_data_ngn_sum": kyshiConnectDataNgnSum,
  };
}