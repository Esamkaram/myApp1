
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/layout/shop_app/cubit/states.dart';
import 'package:myapp2/models/shop_app/categories_model.dart';
import 'package:myapp2/models/shop_app/favorites_model.dart';
import 'package:myapp2/models/shop_app/home_models.dart';
import 'package:myapp2/models/shop_app/login_model.dart';
import 'package:myapp2/modules/shop_app/categores/categors_screen.dart';
import 'package:myapp2/modules/shop_app/favorites/favorits_screen.dart';
import 'package:myapp2/modules/shop_app/products/products_screen.dart';
import 'package:myapp2/modules/shop_app/setting_screen/setting_screen.dart';
import 'package:myapp2/shared/components/constants.dart';
import 'package:myapp2/shared/network/end_points.dart';
import 'package:myapp2/shared/network/remote/dio_helper.dart';

import '../../../models/shop_app/changeFavoritesModels.dart';
import '../../../shared/network/local/cach_helper.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0 ;


 List<Widget> bottomScreens = [
 ProductScreen(),
 CategorsScreen(),
 FavoritsScreen(),
 SettingScreen(),
];

void ChangeBottom (int index){

  currentIndex = index ;
  emit(ShopChangeBottomNavState());

}

  HomeModel? homeMode  ;
Map<int,bool> favorites ={};

void getHomeData(){
  emit(ShopLoadingHomeDataState());

    DioHelper.getData(
       url: HOME ,
    token: CacheHelper.getDate(key: 'token') ,

  ).then((value)
  {

      homeMode = HomeModel.fromJson(value.data);

      // printFullText(homeMode!.toString());
      // print(homeMode!.data!.banners[0].image);
      homeMode!.data!.products.forEach((element){
        favorites.addAll({
          element.id!: element.in_favorites!,
        });
      });

      // print(favorites.toString());

      emit(ShopSuccessHomeDataState());
  }).catchError((error){
     print(error.toString());
      emit(ShopErrorHomeDataState(error.toString()));
  }) ;
}



  CategoriesModel? CategoriesMode  ;

  void getCategories(){

    DioHelper.getData(
      url:  GET_CATEGORIES ,
    ).then((value)
    {

      CategoriesMode = CategoriesModel.fromJson(value.data);

      // printFullText(CategoriesMode!.toString());
      emit(ShopSuccessCATEGORIESDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorCATEGORIESDataState(error.toString()));
    }) ;
  }

  ChangeFavoritesModel? changeFavoritesMode ;

  void changeFavorites(int productId)
  {
    favorites[productId] = !favorites[productId]! ;
    emit(ShopChangeFAVORITESDataState());

    DioHelper.postData(
        url: FAVORITES,
        data:
        {
          'product_id': productId ,
        },
       token: token ,
    ).then((value){

      changeFavoritesMode = ChangeFavoritesModel.fromJson(value.data);
      // print(value.data);
      if (!changeFavoritesMode!.status!)
        {
          favorites[productId] = !favorites[productId]! ;
        }else{
        getFavorites() ;
      }

      emit(ShopSuccessChangeFAVORITESDataState(changeFavoritesMode!));
    }).catchError((error){
      favorites[productId] = !favorites[productId]! ;
      emit(ShopErrorChangeFAVORITESDataState(error));
    });
  }


  FavoritesModel? FavoritesMode  ;

  void getFavorites(){

    emit(ShopLoadingGetFavoritesState());

    DioHelper.getData(
      url:  FAVORITES ,
      token: token ,
    ).then((value)
    {

      FavoritesMode = FavoritesModel.fromJson(value.data);

      // printFullText(FavoritesMode!.toString());
      emit(ShopSuccessGetFavoritesState());
    }).catchError((error){
      // print(error.toString());
      emit(ShopErrorGetFavoritesState(error.toString()));
    }) ;
  }

  ShopLoginModel?  ShopLoginMode  ;

  void getUserProfile()
  {

    // emit(ShopLoadingGetProfileState());

    DioHelper.getData(
      url:  PROFILE ,
      token: token ,
    ).then((value)
    {

      ShopLoginMode = ShopLoginModel.fromJson(value.data);

      // printFullText(ShopLoginMode!.data!.name!);
      emit(ShopSuccessGetProfileState(ShopLoginMode));
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorGetProfileState(error.toString()));
    }) ;
  }


  void updateUserProfile({
    required String name ,
    required String email ,
    required String phone ,


})
  {

    emit(ShopLoadingUpdateProfileState());

    DioHelper.putData(
      url:  UPDATE_PROFILE ,
      token: token ,
      data: {
        'name': name,
        'email':email,
        'phone':phone,
      },
    ).then((value)
    {

      ShopLoginMode = ShopLoginModel.fromJson(value.data);

      // printFullText(ShopLoginMode!.data!.name!);
      emit(ShopSuccessUpdateProfileState(ShopLoginMode));
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorUpdateProfileState(error.toString()));
    }) ;
  }

}






