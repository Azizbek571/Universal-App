import 'package:universal_app/config/Colors.dart';
import 'package:universal_app/config/images.dart';
import 'package:universal_app/config/imports.dart';
import 'package:universal_app/pages/Cities.dart';
import 'package:universal_app/pages/Currencies.dart';
import 'package:universal_app/stores/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text(
              "All in one app",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 24),
            HomeButton(
              icon: Icons.attach_money,
              text: "Currency exchange table",
              subtitle: "You can be aware of current exchange rate",
              image: AppImages.money,
              colors: [AppColors.red, AppColors.red],
              textColor: Colors.white,
              onTap: () {
                Get.to(const currencies());
                controller.fetchCurrencies();
              },
            ),
            HomeButton(
              icon: Icons.attach_money,
              text: "Prayer time",
              subtitle: "You can find out daily praying times for different regions",
              image: AppImages.money,
              colors: [AppColors.red, AppColors.red],
              textColor: Colors.white,
              onTap: () {
                
                 Get.to(const cities());
              },
            ),
          ],
        ),
      )),
    );
  }
}
