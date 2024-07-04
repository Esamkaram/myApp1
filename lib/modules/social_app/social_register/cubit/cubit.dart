

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/modules/shop_app/register/cubit/states.dart';
import 'package:myapp2/shared/components/constants.dart';
import 'package:myapp2/shared/network/end_points.dart';
import 'package:myapp2/shared/network/remote/dio_helper.dart';

import '../../../../models/shop_app/login_model.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates>
{
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);
   ShopLoginModel? loginMod   ;


  void userRegister({
    required String email ,
    required String password ,
    required String name ,
    required String phone ,

}) {


    emit(ShopRegisterLoadingState());


    DioHelper.postData(
        url: REGISTER,
        data: {
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,
        },
    ).then((value){
      printFullText(value.toString());
      loginMod = ShopLoginModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(loginMod));
    }).catchError((error){
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }



  IconData suffix = Icons.visibility_outlined ;
  bool isPassword = true ;

  void changePasswordVisibility()
  {
    isPassword = !isPassword ;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;
    emit(ShopRegisterChangePasswordVisibilityState());

  }


}