import 'package:dio/dio.dart';
import 'package:universal_app/config/imports.dart';
import 'package:universal_app/models/products_model.dart';

class ProductsController extends GetxController{
  bool loading=false;
  Dio http=Dio();
  List<ProductsModel> products=[];

  fetchProducts()async{
    try{
      var res = await http.get('https://fakestoreapi.com/products');
       products=productModelFromJson(res.data);  
    }catch(err){
      print(err);

    }
  }
  @override
  void onInit() {
   fetchProducts();
    super.onInit();
  }
}