class CurrenciesModel {
  String CcyNm_UZ;
  String Nominal;
  String Rate;
  String Date;

  CurrenciesModel({
    required this.CcyNm_UZ,
    required this.Nominal,
    required this.Rate,
    required this.Date,
  });
  factory CurrenciesModel.fromJson(Map<String, dynamic> json) =>
      CurrenciesModel(
          CcyNm_UZ: json['CcyNm_UZ'],
          Nominal: json['Nominal'],
          Rate: json['Rate'],
          Date: json['Date']);
}

List<CurrenciesModel> currenciesFromMap(List list) =>
    List<CurrenciesModel>.from(
        list.map((item) => CurrenciesModel.fromJson(item)));
