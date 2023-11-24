import 'package:flutter/material.dart';
import 'package:universal_app/config/imports.dart';
import 'package:universal_app/stores/home_controller.dart';

class currencies extends StatefulWidget {
  const currencies({super.key});

  @override
  State<currencies> createState() => _currenciesState();
}

class _currenciesState extends State<currencies> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: Text("Valyuta kurslari")),
          body: SingleChildScrollView(
              child: Container(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
            child:
            controller.loading ? const Center(child: CircularProgressIndicator()):
             Column(
                children: List.generate(controller.currencies.length, (index) {
              var item = controller.currencies[index];
              return ListTile(
                title: Text.rich(TextSpan(
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(text: item['Nominal'] + " "),
                      TextSpan(text: item['CcyNm_UZ']),
                    ])),
                subtitle: Text(item['Date']),
                trailing: Text(
                  item['Rate'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              );
            })),
          )),
        );
      },
    );
  }
}
