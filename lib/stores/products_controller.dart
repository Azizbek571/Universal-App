import 'package:dio/dio.dart';
import 'package:universal_app/config/imports.dart';
import 'package:universal_app/models/products_model.dart';

class ProductsController extends GetxController{
  bool loading=false;
  Dio http=Dio();
  List<ProductsModel> products=[];

  fetchProducts()async{
    loading=true;
    update();
    try{
      await Future.delayed(Duration(seconds: 3));
      var res = await http.get('https://fakestoreapi.com/products');
       products=productModelFromJson(res.data);  
    }catch(err){
      print(err);

    }finally{
       loading=false;
    update();
    }
  }
  @override
  void onInit() {
   fetchProducts();
    super.onInit();
  }
}