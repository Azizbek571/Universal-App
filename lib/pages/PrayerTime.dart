import 'package:universal_app/config/imports.dart';
import 'package:universal_app/stores/home_controller.dart';

class PrayerTime extends StatefulWidget {
  const PrayerTime({super.key});

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  HomeController controller = Get.put(HomeController());
  List times = [];
  filterTime(data) {
    data.forEach((key, value) {
      times.add({"time": key, "hour": value});
    });
  }

  @override
  void initState() {
    filterTime(controller.prayerTime['times']);
    super.initState();
  }

  String filterText(String key) {
    switch (key) {
      case "tong_saharlik":
        return "Bomdod namozi";
      case "quyosh":
        return "Quyosh";
      case "peshin":
        return "Peshin namozi";
      case "asr":
        return "Asr namozi";
      case "shom_iftor":
        return "Shom namozi";
      case "hufton":
        return "Xufton namozi";

      default:
        return "";
    }
  }

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
                Text(controller.prayerTime['date'], style: TextStyle(fontSize: 20, fontWeight:FontWeight.w600),),
                Text(controller.prayerTime['weekday'], style: TextStyle(fontSize: 20, fontWeight:FontWeight.w600),),
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
