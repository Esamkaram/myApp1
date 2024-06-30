
class HomeModel {

  bool status = true ;
  HomeDataModel? data ;

  HomeModel.fromJson(Map<String,dynamic> json){
  status = json['status'];
  data = HomeDataModel.fromJson(json['data']);

}
}

class HomeDataModel
{
  List<bannerModel> banners = [];
  List<ProductModel> products = [];

  HomeDataModel.fromJson(Map<String,dynamic> json)
  {
    json['banners'].forEach((element){
      // banners.add(element);
      banners.add(bannerModel.fromJson(element));
    });

    // if (banners != null) {
    //   data['banners'] = products!.map((v) => v.toJson()).toList();
    // }

    json['products'].forEach((element){
      // products.add(element);
      products.add(ProductModel.fromJson(element));
    });
  }

}

class bannerModel {
  int? id ;
  String? image ;

  bannerModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel{
  int? id ;
  String? price ;
  String? old_price ;
  String? discount ;
  String? image ;
  String? name ;
  bool? in_favorites ;
  bool? in_cart ;


  ProductModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    price = json['price']==0?'0.0':json['price'].toString();
    old_price = json['old_price']==0?'0.0':json['old_price'].toString();
    discount = json['discount']==0?'0.0':json['discount'].toString();
    name = json['name'];
    image = json['image'];
    in_favorites = json['in_favorites'];
    in_cart = json['in_cart'];
  }
}