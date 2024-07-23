import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/layout/social_app/scoial_layout.dart';
import 'package:myapp2/modules/social_app/social_login/cubit/cubit.dart';
import 'package:myapp2/modules/social_app/social_login/cubit/states.dart';
import 'package:myapp2/modules/social_app/social_register/regster_screen.dart';
import 'package:myapp2/shared/components/constants.dart';
import 'package:myapp2/shared/network/local/cach_helper.dart';
import 'package:myapp2/styles/colors.dart';

import '../../../shared/components/components.dart';

class SocialLoginScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context,state){
          if (state is SocialLoginErrorState)
          {
            showToast(message: state.error, state: ToastStates.ERROR);
          }
          if (state is SocialLoginSuccessState)
            {
              CacheHelper.saveData(key: 'uId', value: state.uId.toString(),
              ).then((value){
                // token = state.uId ;
                navigateAndFinish(context, ScoialLayout(),);
              });
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
                        Text('LOGIN',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text('login new to communicate with friends',
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
                          suffix: SocialLoginCubit.get(context).suffix,
                          iconSuffixPressed: (){
                            SocialLoginCubit.get(context).changePasswordVisibility() ;
                          },
                          isPassword: SocialLoginCubit.get(context).isPassword,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingState,
                          builder: (context) => defaultButton(
                            function: (){
                              if(formKey.currentState!.validate())
                              {
                                print('validate');

                                SocialLoginCubit.get(context).userLogin(email: emailController.text, password: passwordController.text) ;
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
                               navigateTo(context, SocialRegsterScreen(),);
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
          ) ;
        },
      ),
    );
  }
}
