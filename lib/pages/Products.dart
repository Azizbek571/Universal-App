import 'package:universal_app/config/imports.dart';
import 'package:universal_app/stores/products_controller.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
 ProductsController controller = Get.put(ProductsController());

  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
      builder: (controller) {
          return Scaffold(
        appBar: AppBar(title: Text('Products'),),
        body: Column(
          children: [
            Text('Products')
          ],
        )
      );
      },
    
    );
  }
}