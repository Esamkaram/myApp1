import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/layout/shop_app/cubit/cubit.dart';
import 'package:myapp2/layout/shop_app/cubit/states.dart';
import 'package:myapp2/shared/components/components.dart';
import 'package:myapp2/shared/components/constants.dart';

class SettingScreen extends StatelessWidget {
var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
      listener: (context,state){
      } ,
      builder: (context,state){
        var model = ShopCubit.get(context).ShopLoginMode ;
        nameController.text = model!.data!.name!;
        emailController.text = model!.data!.email! ;
        phoneController.text = model!.data!.phone! ;

        return  ConditionalBuilder(
          condition: ShopCubit.get(context).ShopLoginMode != null ,
          builder:(context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  if(state is ShopLoadingUpdateProfileState)
                  LinearProgressIndicator(),
                  SizedBox(
                    height: 10.0,
                  ),

                  defaultTextFilad(
                      controller: nameController,
                      type: TextInputType.name,
                      label: 'Name',
                      preFix: Icons.person,
                      validate: (String value){
                        if(value.isEmpty){
                          return 'name must not be empty ';
                        }
                        return null ;
                      }
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultTextFilad(
                      controller: emailController,
                      type: TextInputType.name,
                      label: 'Email',
                      preFix: Icons.email,
                      validate: (String value){
                        if(value.isEmpty){
                          return 'Email must not be empty ';
                        }
                        return null ;
                      }
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultTextFilad(
                      controller: phoneController,
                      type: TextInputType.name,
                      label: 'Phone Number',
                      preFix: Icons.phone,
                      validate: (String value){
                        if(value.isEmpty){
                          return 'Phone must not be empty ';
                        }
                        return null ;
                      }
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                      function: (){
                        if (formKey.currentState!.validate())
                        {
                          ShopCubit.get(context).updateUserProfile(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                          );
                        }
                      },
                      text: 'Update'),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                      function: (){
                        signOut(context);
                      },
                      text: 'Logout')
              
                ],
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        ) ;
      } ,

    );
  }
}
