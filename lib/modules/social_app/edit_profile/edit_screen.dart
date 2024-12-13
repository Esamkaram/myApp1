import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp2/layout/social_app/cubit/cubit.dart';
import 'package:myapp2/layout/social_app/cubit/states.dart';
import 'package:myapp2/shared/components/components.dart';

class EditScreen extends StatelessWidget {

  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        var userModel = SocialCubit.get(context).userModel ;
        var profileimage = SocialCubit.get(context).profileimage;
        var coverimage = SocialCubit.get(context).coverimage ;

        nameController.text  = userModel!.name! ;
        bioController.text = userModel!.bio! ;
        phoneController.text = userModel!.phone! ;
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 5.0,
            title: Text('Edit Profile',),
            actions: [
              TextButton(onPressed: (){
                SocialCubit.get(context).updateUsers(
                    name: nameController.text,
                    phone: phoneController.text,
                    bio: bioController.text);
              } ,
              child: Text('Update',),
              ),
              SizedBox(
                width: 10.0,
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if(state is SocialLoadingUserUpdateStates)
                  LinearProgressIndicator(),
                  SizedBox(height: 10.0,),
                  Container(
                    height: 180.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                            child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                             children: [
                               Container(
                                 height: 140.0,
                                 width: double.infinity,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.only(
                                     topLeft: Radius.circular(4.0,),
                                     topRight:  Radius.circular(4.0,),
                                   ),
                                   image: DecorationImage(
                                     image: coverimage == null ?  NetworkImage(
                                       '${userModel!.cover}',
                                     ) : FileImage(coverimage),
                                     fit: BoxFit.cover,
                                   ),
                                 ),
                               ),
                               CircleAvatar(
                                 radius: 20.0,
                                 child: IconButton(
                                   onPressed: (){
                                     SocialCubit.get(context).getCoverImage();
                                   },
                                   icon: Icon(
                                     FontAwesomeIcons.camera,
                                     size: 16.0,
                                   ),
                                 ),
                               ),
                             ],
                            ),
                            alignment: AlignmentDirectional.topCenter
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 65.0,
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: profileimage == null ? NetworkImage(
                                  '${userModel!.image}',) : FileImage(profileimage),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20.0,
                              child: IconButton(
                                onPressed: (){
                                  SocialCubit.get(context).getProfileImage() ;
                                },
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 16.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                        if (SocialCubit.get(context).profileimage != null || SocialCubit.get(context).coverimage != null)
                        Row(
                          children: [
                            if(SocialCubit.get(context).profileimage != null )
                            Expanded(
                              child: Column(
                                children: [
                                  defaultButton(
                                    function: (){
                                      SocialCubit.get(context).upLoadProfileImage(
                                          name: nameController.text,
                                          phone: phoneController.text,
                                          bio: bioController.text,);
                                    },
                                    text: 'up profile'
                                  ),
                                  if(state is SocialLoadingUserUpdateStates)
                                  SizedBox(height: 5.0,),
                                  if(state is SocialLoadingUserUpdateStates)
                                  LinearProgressIndicator(),
                                ],
                              ),
                            ),
                            SizedBox(width: 5.0,),
                            if(SocialCubit.get(context).coverimage != null)
                            Expanded(
                              child: Column(
                                children: [
                                  defaultButton(
                                      function: (){
                                        SocialCubit.get(context).upLoadCoverImage(
                                          name: nameController.text,
                                          phone: phoneController.text,
                                          bio: bioController.text,);
                                      },
                                      text: 'up cover'
                                  ),
                                  if(state is SocialLoadingUserUpdateStates)
                                  SizedBox(height: 5.0,),
                                  if(state is SocialLoadingUserUpdateStates)
                                  LinearProgressIndicator(),
                                ],
                              ),
                            ),
                          ],
                        ),
                  if (SocialCubit.get(context).profileimage != null || SocialCubit.get(context).coverimage != null)
                  SizedBox(
                    height: 20.0,
                  ),
                        defaultTextFilad(
                            controller: nameController,
                            type: TextInputType.name,
                            label: 'Name',
                            preFix: Icons.person_2_outlined,
                            validate: (String value)
                            {
                              if (value.isEmpty)
                                {
                                  return 'name must be Empty';
                                }
                              return null ;

                            }
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defaultTextFilad(
                            controller: bioController,
                            type: TextInputType.text,
                            label: 'Bio',
                            preFix: Icons.info,
                            validate: (String value)
                            {
                              if (value.isEmpty)
                              {
                                return 'Bio must be Empty';
                              }
                              return null ;

                            }
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defaultTextFilad(
                            controller: phoneController,
                            type: TextInputType.phone,
                            label: 'Phone',
                            preFix: Icons.phone,
                            validate: (String value)
                            {
                              if (value.isEmpty)
                              {
                                return 'phone must be Empty';
                              }
                              return null ;

                            }
                        ),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
