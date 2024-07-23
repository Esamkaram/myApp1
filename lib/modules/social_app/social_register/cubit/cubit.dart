
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/models/social_app/soial_user_model.dart';
import 'package:myapp2/modules/social_app/social_register/cubit/states.dart';




class SocialRegisterCubit extends Cubit<SocialRegisterStates>
{
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String email ,
    required String password ,
    required String name ,
    required String phone ,

}) {


    emit(SocialRegisterLoadingState());
    
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password
    ).then((value){
      print(value!.user!.email);
      print(value!.user!.uid);
      userCreate(
        uId: value!.user!.uid,
        name: name,
        email: email,
        phone: phone,
      );
      // emit(SocialRegisterSuccessState());

    }).catchError((error) {
      emit(SocialRegisterErrorState(error.toString()));

    });


  }


void userCreate({
  required String email ,
  required String name ,
  required String phone ,
  required String uId ,
})
{
  SocialUserModel model = SocialUserModel(
    name: name ,
    email: email,
    phone: phone,
    uId: uId ,
    image: 'https://img.freepik.com/free-vector/gradient-hajj-background_23-2149430058.jpg?t=st=1720447060~exp=1720450660~hmac=29c221fb80e4a6357dac255725021da28eadc84a82a28f973cd02b96f4a92e25&w=996' ,
    bio: 'write you bio ',
    cover: 'https://img.freepik.com/free-vector/gradient-hajj-background_23-2149430058.jpg?t=st=1720447060~exp=1720450660~hmac=29c221fb80e4a6357dac255725021da28eadc84a82a28f973cd02b96f4a92e25&w=996' ,
    isEmailVerified: false ,
  ) ;

  FirebaseFirestore.instance
      .collection('users')
      .doc(uId).set(model.toMap()).then((value){
        emit(SocialCreateUserSuccessState());
  }).catchError((error){
        emit(SocialCreateUserErrorState(error.toString()));
  });
}

  IconData suffix = Icons.visibility_outlined ;
  bool isPassword = true ;

  void changePasswordVisibility()
  {
    isPassword = !isPassword ;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;
    emit(SocialRegisterChangePasswordVisibilityState());

  }


}