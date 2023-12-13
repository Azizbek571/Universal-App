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
      times =[];
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
   PrayerTimeModel?   prayerTime;
  String selectCity='';
  fetchPrayerTimes() async {
    loading=true;
    update();
    Get.to(()=> const PrayerTime());
    
    try {
      
      var res = 
      await http.get('https://islomapi.uz/api/present/day?region=$selectCity');
          prayerTime = PrayerTimeModel.fromJson(res.data);
          filterTime(prayerTime!.times);
          Get.to(()=> const PrayerTime());
    } catch (err) {
      print(err);
    }finally{
        loading=false;
    update();
    }
  }

 Map<String, dynamic>keys = {
    "tong_saharlik":"Bomdod namozi",
    "quyosh":"Quyosh",
    "peshin":"Peshin namozi",
    "asr":"Asr namozi",
    "shom_iftor":"Shom namozi",
    "hufton":"Xufton namozi",

  };
  filterText(String key){
  return keys [key]??'';}


  List times = [];
 filterTime( data) {
    data.forEach((key, value) {
      times.add({"time": key, "hour": value});
    });
  }




}
