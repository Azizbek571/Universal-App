import 'package:universal_app/config/imports.dart';

class TasbehController extends GetxController {
String selected='';

  Map<String, dynamic> duolar = {
    "Subhanalloh": {
      "id": 1,
      "title": "Subhanalloh",
      "text": "Allohni Pok Zot ekanini tan olaman",
      "count":0
    },
    "Alhamdulillah": {
      "id": 1,
      "title": "Alhamdulillah",
      "text": "Allohga hamd(maqtov,shukr) bo'lsin",
      "count":0
    },
    "Allohu Akbar": {
      "id": 1,
      "title": "Allohu Akbar",
      "text": "Alloh Buyukdir",
      "count":0
    },
    "Astag'firullah Wa Atubu ilaih": {
      "id": 1,
      "title": "Astag'firullah Wa Atubu ilaih",
      "text": "Allohning mag'firatini so'rab tavba qilaman",
      "count":0
    },
    "La ilaha illallohu Muhammadur Rasululloh": {
      "id": 1,
      "title": "La ilaha illallohu Muhammadur Rasululloh",
      "text": "Allohdan boshqa iloh yo'q. Muhammad Uning elchisidir(Sollallohu alayhi vasallam )",
      "count":0
    }
  };

  addCount(
    
  ){
    duolar[selected]['count']++;
    GetStorage().write(selected, duolar[selected]['count']);
    update();
  }
  check(){
    int count= GetStorage().read(selected)??0;
    duolar[selected]['count']=count;
    update();
  }
  reset(){
    if(duolar[selected]['count']==0)return;
    GetStorage().remove(selected);
    duolar[selected]['count']=0;
    update();
  }


}
