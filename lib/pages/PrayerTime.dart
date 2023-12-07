import 'package:universal_app/config/imports.dart';

class PrayerTime extends StatefulWidget {
  const PrayerTime({super.key});

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  HomeController controller = Get.put(HomeController());
  List times = [];
  filterTime( data) {
    data.forEach((key, value) {
      times.add({"time": key, "hour": value});
    });
  }

  @override
  void initState() {
    filterTime(controller.prayerTime!.times);
    super.initState();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${controller.selectCity} vaqti bilan"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                Text(controller.prayerTime!.date, style: TextStyle(fontSize: 20, fontWeight:FontWeight.w600),),
                Text(controller.prayerTime!.weekday, style: TextStyle(fontSize: 20, fontWeight:FontWeight.w600),),
              ],

              ),
              const Divider(),
              Column(
                children: List.generate(times.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(filterText(times[index]['time']),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        Text(times[index]['hour'],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ));
  }
}
