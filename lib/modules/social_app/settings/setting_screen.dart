
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/layout/social_app/cubit/cubit.dart';
import 'package:myapp2/layout/social_app/cubit/states.dart';

import 'package:myapp2/modules/social_app/edit_profile/edit_screen.dart';
import 'package:myapp2/shared/components/components.dart';

class SettingScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit , SocialStates>(
      listener: (context, state) {},
    builder: (context,state){
         var userModel = SocialCubit.get(context).userModel! ;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 180.0,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                        child: Container(
                          height: 140.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0,),
                              topRight:  Radius.circular(4.0,),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                '${userModel!.cover}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        alignment: AlignmentDirectional.topCenter
                    ),
                    CircleAvatar(
                      radius: 65.0,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage(
                            '${userModel!.image}',),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                '${userModel!.name}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                '${userModel!.bio}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '100 ',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              'Post ',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                        onTap: (){},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '300 ',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              'Photo ',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                        onTap: (){},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '10K ',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              'Followers ',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                        onTap: (){},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '64 ',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              'Following ',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                        onTap: (){},
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: (){},
                      child: Text('Add Photos ' ,) ,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  OutlinedButton(
                    onPressed: (){
                      navigateTo(context, EditScreen());
                    },
                    child: Icon(
                      Icons.edit,
                      size: 16.0,
                    ) ,
                  ),
                ],
              ),
            ],
          ),
        );
    },
    );
  }
}
