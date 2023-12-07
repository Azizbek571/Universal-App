import 'package:dio/dio.dart';
import 'package:universal_app/config/imports.dart';
import 'package:universal_app/models/prayer_time_model.dart';


class HomeController extends GetxController {
  // https://cbu.uz/uz/arkhiv-kursov-valyut/json/

  Dio http = Dio();

  List<CurrenciesModel> currencies = [];

  bool loading = false;

  fetchCurrencies() async {
    try {
      loading = true;
      update();
      var res = await http.get('https://cbu.uz/uz/arkhiv-kursov-valyut/json/');
      currencies = currenciesFromMap(res.data);
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }
// https://islomapi.uz/api/present/day?region=Toshkent

  List<String> cities = [
    "Toshkent",
    "Farg'ona",
    "Andijon",
    "Namangan",
    "Buxoro",
    "Samarqand",
    "Navoiy",
    "Qo'qon",
    "Xiva",
    "Nukus",
    "Jizzax",
    "Guliston",
    "Qarshi",
    
  ];
  late PrayerTimeModel?   prayerTime;
  String selectCity='';
  fetchPrayerTimes() async {
    loading=true;
    update();
    try {
      var res = 
      await http.get('https://islomapi.uz/api/present/day?region=$selectCity');
          prayerTime = PrayerTimeModel.fromJson(res.data);
          Get.to(()=> const PrayerTime());
    } catch (err) {
      print(err);
    }finally{
        loading=false;
    update();
    }
  }
}
