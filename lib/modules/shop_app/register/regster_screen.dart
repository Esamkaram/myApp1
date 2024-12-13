import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/modules/shop_app/register/cubit/cubit.dart';
import 'package:myapp2/modules/shop_app/register/cubit/states.dart';

import 'package:myapp2/shared/components/components.dart';
import 'package:myapp2/shared/network/local/cach_helper.dart';

import '../../../layout/shop_app/shop_layout.dart';
import '../../../shared/components/constants.dart';

class ShopRegsterScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController() ;
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit , ShopRegisterStates>(
        listener: (context , state){
          if(state is ShopRegisterSuccessState){
            if   (state.loginModel!.status){
              print(state.loginModel!.message);
              print(state.loginModel!.data!.token);
              showToast(
                  message:   state.loginModel!.message.toString(),
                  state: ToastStates.SUCCESS
              );
              CacheHelper.saveData(key: 'token', value: state.loginModel!.data!.token.toString(),
              ).then((value){
                token = state.loginModel!.data!.token ;
                navigateAndFinish(context, ShopLayout(),);
              });
            }else
            {
              showToast(message:  state.loginModel!.message.toString() ,
                  state: ToastStates.ERROR);
            }
          }

        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Register',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text('Register new to browse our hot offers',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        defaultTextFilad(
                          controller: nameController,
                          type: TextInputType.name,
                          onTap: (){},
                          onChinged: (){},
                          label: 'User Name ',
                          validate: (String value){
                            if (value.isEmpty){
                              return 'plase enter your name ';
                            }
                          },
                          preFix: Icons.person,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultTextFilad(
                          controller: phoneController,
                          type: TextInputType.phone,
                          onTap: (){},
                          onChinged: (){},
                          label: 'Phone Number',
                          validate: (String value){
                            if (value.isEmpty){
                              return 'plase enter your phone number';
                            }
                          },
                          preFix: Icons.phone,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultTextFilad(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          onTap: (){},
                          onChinged: (){},
                          label: 'Email Address',
                          validate: (String value){
                            if (value.isEmpty){
                              return 'plase enter your email address';
                            }
                          },
                          preFix: Icons.email,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultTextFilad(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          onTap: (){},
                          onChinged: (){},
                          label: 'Password ',
                          validate: (String value){
                            if (value.isEmpty){
                              return 'plase enter password';
                            }
                          },
                          preFix: Icons.lock_outline,
                          suffix: ShopRegisterCubit.get(context).suffix,
                          iconSuffixPressed: (){
                            ShopRegisterCubit.get(context).changePasswordVisibility() ;
                          },
                          isPassword: ShopRegisterCubit.get(context).isPassword,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState ,
                          builder: (context) =>
                              defaultButton(
                            function: (){
                              if(formKey.currentState!.validate())
                              {
                                print('validate');

                                ShopRegisterCubit.get(context).userRegister(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text ,
                                  phone: phoneController.text ,
                                ) ;
                              }
                            },
                            text: 'Register',
                            isUpper: true ,
                          ),
                          fallback: (context)=>Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ) ;
        },
      ),
    );
  }
}
