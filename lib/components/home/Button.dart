import 'package:universal_app/config/imports.dart';

class HomeButton extends StatelessWidget {
  IconData icon;
  String text, subtitle, image;
  Function onTap;
  List<Color> colors;
  Color textColor;

  HomeButton({
    super.key,
    required this.icon,
    required this.text,
    required this.subtitle,
    required this.image,
    required this.onTap,
    required this.colors,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            onTap();
          },
          child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: colors),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(text,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: textColor)),
                        Text(subtitle,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: textColor))
                      ],
                    ),
                  ),
                  const SizedBox(width: 3),
                  Image.asset(image, width: 60)
                ],
              )),
        ),
        const SizedBox(height: 12)
      ],
    );
  }
}
