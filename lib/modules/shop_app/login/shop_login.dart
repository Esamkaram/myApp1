

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp2/layout/shop_app/shop_layout.dart';
import 'package:myapp2/modules/shop_app/login/cubit/cubit.dart';
import 'package:myapp2/modules/shop_app/login/cubit/states.dart';
import 'package:myapp2/modules/shop_app/register/shop_regster_screen.dart';
import 'package:myapp2/shared/components/components.dart';
import 'package:myapp2/shared/network/local/cach_helper.dart';
import 'package:myapp2/styles/colors.dart';

class ShopLogin extends StatelessWidget {

var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();

    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context)=> ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (context, state){
          if(state is ShopLoginSuccessState){
            if   (state.loginModel!.status){
              print(state.loginModel!.message);
              print(state.loginModel!.data!.token);
              showToast(
                message:   state.loginModel!.message.toString(),
                state: ToastStates.SUCCESS
              );
              CacheHelper.saveData(key: 'token', value: state.loginModel!.data!.token.toString(),
              ).then((value){
                navigateAndFinish(context, ShopLayout(),);
              });
            }else
              {
                showToast(message:  state.loginModel!.message.toString() ,
                    state: ToastStates.ERROR);
              }
          }
        },
        builder: (context,state) {
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
                  Text('LOGIN',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('login new to browse our hot offers',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 40.0,
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
                    suffix: ShopLoginCubit.get(context).suffix,
                    iconSuffixPressed: (){
                      ShopLoginCubit.get(context).changePasswordVisibility() ;
                    },
                    isPassword: ShopLoginCubit.get(context).isPassword,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ConditionalBuilder(
                    condition: state is! ShopLoginLoadingState,
                    builder: (context) => defaultButton(
                      function: (){
                        if(formKey.currentState!.validate())
                        {
                          print('validate');

                                ShopLoginCubit.get(context).userLogin(email: emailController.text, password: passwordController.text) ;
                        }
                      },
                      text: 'login',
                      isUpper: true ,
                    ),
                    fallback: (context)=>Center(child: CircularProgressIndicator()),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?',
                      ),
                      TextButton(onPressed: (){
                        navigateTo(context, ShopRegsterScreen(),);
                      }
                        , child: Text('REGISTER NOW', style: TextStyle(color: defaultColors),),),
                    ],
                  ),
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
        },
      ),
    );
  }
}
