import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/models/shop_app/login_model.dart';
import 'package:myapp2/modules/shop_app/login/cubit/states.dart';
import 'package:myapp2/shared/components/constants.dart';
import 'package:myapp2/shared/network/end_points.dart';
import 'package:myapp2/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
   ShopLoginModel? loginMod   ;


  void userLogin({
    required String email ,
    required String password ,

}) {
    print(email);
    print(password);

    emit(ShopLoginLoadingState());


    DioHelper.postData(
        url: LogIn,
        data: {
          'email':email,
          'password':password ,
        },
    ).then((value){
      printFullText(value.toString());
      loginMod = ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginMod));
    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined ;
  bool isPassword = true ;

  void changePasswordVisibility()
  {
    isPassword = !isPassword ;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;
    emit(ShopChangePasswordVisibilityState());

  }

}