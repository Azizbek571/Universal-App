
import 'package:universal_app/config/imports.dart';
import 'package:universal_app/pages/Duolar/TasbehMain.dart';

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
        backgroundColor: Colors.blue,
          body: Center(
            child: Container(
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
                colors: [AppColors.blue, AppColors.red],
                textColor: Colors.white,
                onTap: () {
                  Get.to(() =>const currencies());
                  controller.fetchCurrencies();
                },
              ),
              HomeButton(
                icon: Icons.attach_money,
                text: "Prayer time",
                subtitle: "You can find out daily praying times for different regions",
                image: AppImages.masjid,
                colors: [AppColors.violet, AppColors.pink],
                textColor: Colors.white,
                onTap: () {
                  
                   Get.to(()=> const cities());
                },
              ),
              HomeButton(
                icon: Icons.attach_money,
                text: "Electronic Counter(Tasbeh)", 
                subtitle: "Do not forget to do zikr every day",
                image: AppImages.muslim,
                colors: [AppColors.red, AppColors.yellow],
                textColor: Colors.white,
                onTap: () {
                  
                   Get.to(()=> const TasbehMain  ());
                },
              ),
              HomeButton(
                icon: Icons.attach_money,
                text: "Products",
                subtitle: "The cheapest products for you",
                image: AppImages.money,
                colors: [AppColors.violet, AppColors.blue],
                textColor: Colors.white,
                onTap: () {
                  
                   Get.to(()=> const Products   ());
                },
              ),
            ],
                  ),
                ),
          )),
    );
  }
}
