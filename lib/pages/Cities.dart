import 'package:universal_app/config/imports.dart';
import 'package:universal_app/stores/home_controller.dart';

class cities extends StatefulWidget {
  const cities({super.key});

  @override
  State<cities> createState() => _citiesState();
}

class _citiesState extends State<cities> {
HomeController controller =Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choose your region"),),
      body: Column(
        children: List.generate(controller.cities.length, (index){
          return ListTile(
            title: Text(controller.cities[index]),
            leading: Icon(Icons.location_city),
            trailing: Icon(Icons.arrow_right, size: 35),
            onTap: () {
              controller.selectCity=controller.cities[index];
              controller.fetchPrayerTimes();
            },
          );
        }),
      )
    );
  }
}
